@implementation _UISearchParticipantInteraction

- (void)_updateActiveSearchParticipationIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_UISearchParticipantInteraction _windowScene](self, "_windowScene");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISearchParticipantInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "windowScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v10)
  {
    -[_UISearchParticipantInteraction _teardown](self, "_teardown");
    if (v5)
    {
      objc_msgSend(v5, "_searchActivityManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchParticipantInteraction view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "beginTrackingActiveSearchParticipant:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchParticipantInteraction set_searchParticipantToken:](self, "set_searchParticipantToken:", v8);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__updateActiveSearchParticipationIfNeeded, 0x1E1764CC0, v4);

      -[_UISearchParticipantInteraction set_windowScene:](self, "set_windowScene:", v5);
    }
  }

}

- (void)_teardown
{
  void *v3;
  void *v4;

  -[_UISearchParticipantInteraction set_windowScene:](self, "set_windowScene:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[_UISearchParticipantInteraction _searchParticipantToken](self, "_searchParticipantToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[_UISearchParticipantInteraction set_searchParticipantToken:](self, "set_searchParticipantToken:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[_UISearchParticipantInteraction _teardown](self, "_teardown");
  v3.receiver = self;
  v3.super_class = (Class)_UISearchParticipantInteraction;
  -[_UISearchParticipantInteraction dealloc](&v3, sel_dealloc);
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  -[_UISearchParticipantInteraction _updateActiveSearchParticipationIfNeeded](self, "_updateActiveSearchParticipationIfNeeded");
}

- (BSInvalidatable)_searchParticipantToken
{
  return self->__searchParticipantToken;
}

- (void)set_searchParticipantToken:(id)a3
{
  objc_storeStrong((id *)&self->__searchParticipantToken, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIWindowScene)_windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->__windowScene);
}

- (void)set_windowScene:(id)a3
{
  objc_storeWeak((id *)&self->__windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__windowScene);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->__searchParticipantToken, 0);
}

@end
