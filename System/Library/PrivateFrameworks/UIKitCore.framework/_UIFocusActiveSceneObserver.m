@implementation _UIFocusActiveSceneObserver

- (_UIFocusActiveSceneObserver)init
{
  return -[_UIFocusActiveSceneObserver initWithScene:](self, "initWithScene:", 0);
}

- (_UIFocusActiveSceneObserver)initWithScene:(id)a3
{
  id v5;
  __objc2_class **v6;
  _UIFocusActiveSceneObserver *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusActiveSceneObserver.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  if (((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FocusModernSceneObserver, (uint64_t)CFSTR("FocusModernSceneObserver"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1ECD75E9C)&& (_UISceneSystemShellManagesKeyboardFocusForScene(v5) & 1) != 0)
  {
    v6 = off_1E167C568;
  }
  else
  {
    v6 = off_1E167C560;
  }
  v7 = (_UIFocusActiveSceneObserver *)objc_msgSend(objc_alloc(*v6), "_initWithScene:", v5);

  return v7;
}

- (id)_initWithScene:(id)a3
{
  id v4;
  _UIFocusActiveSceneObserver *v5;
  _UIFocusActiveSceneObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusActiveSceneObserver;
  v5 = -[_UIFocusStateObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scene, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
