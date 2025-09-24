// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import DependencyKit
import ClutchModularProtocols

//MARK: Page
/// Pages on the application
///  An enum representing pages in the application.
public enum Page : Hashable {
    case onboarding
    case account
    case selectFavTeam
    case home
    case favMatchList
    case standing
}


//MARK: Navigation
///  Navigation class for managing the navigation stack.
public class Navigation : ObservableObject {
    public init() { }
    @Published public var  path = NavigationPath()
    
    /// Push a new page into the navigation stack.
    public  func push(_ page:Page){
        path.append(page)
       
    }
    /// Pop the last page from the navigation stack.
    public  func pop() {
        path.removeLast()
    }
    /// Pop all the pages, going back to the root page.
    public  func popToRoot(){
        path.removeLast(path.count)
    }
    
    /// Build the appropriate view for a given page.
    @ViewBuilder
    public  func build(page:Page) -> some View {
        switch page {
        case .onboarding:
            /// Dependency resolution and view creation for the home page
            let onboardingModule:OnboardingModuleProtocol = DependencyRegister.shared.resolve(OnboardingModuleProtocol.self)
            onboardingModule.createOnboardingModuleView()
        case .account:
            let accountModule:AccountModuleProtocol = DependencyRegister.shared.resolve(AccountModuleProtocol.self)
            accountModule.createAccountModule()
        case .selectFavTeam:
            let selectFavoriteTeamModule : SelectFavoriteTeamModuleProtocol = DependencyRegister.shared.resolve(SelectFavoriteTeamModuleProtocol.self)
            selectFavoriteTeamModule.createSelecteFavoriteTeamModule()
        
        case .home:
            let homeModule :HomeModuleProtocol =
            DependencyRegister.shared.resolve(HomeModuleProtocol.self)
            homeModule.createHomeModule()
        case .favMatchList:
            let favMatchModule :FavMatchListModuleProtocol =
            DependencyRegister.shared.resolve(FavMatchListModuleProtocol.self)
            favMatchModule.createFavMatchListModule()
        case .standing:
            let standingModule :StandingModuleProtocol =
            DependencyRegister.shared.resolve(StandingModuleProtocol.self)
            standingModule.createStandingModule()
        }
    }
}

