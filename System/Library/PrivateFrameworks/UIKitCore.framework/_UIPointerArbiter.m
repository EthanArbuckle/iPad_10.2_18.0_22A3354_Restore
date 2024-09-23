@implementation _UIPointerArbiter

+ (id)sharedArbiter
{
  if (_MergedGlobals_1150 != -1)
    dispatch_once(&_MergedGlobals_1150, &__block_literal_global_378);
  return (id)qword_1ECD7F188;
}

- (_UIPointerArbiter)init
{
  _UIPointerArbiter *v2;
  uint64_t v3;
  _UIPointerArbitrating *core;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPointerArbiter;
  v2 = -[_UIPointerArbiter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    core = v2->_core;
    v2->_core = (_UIPointerArbitrating *)v3;

  }
  return v2;
}

- (void)applyStyle:(id)a3 forRegion:(id)a4 effectSourceHandler:(id)a5 completion:(id)a6
{
  -[_UIPointerArbitrating applyStyle:forRegion:effectSourceHandler:completion:](self->_core, "applyStyle:forRegion:effectSourceHandler:completion:", a3, a4, a5, a6);
}

- (void)exitRegion:(id)a3 removeStyle:(BOOL)a4 completion:(id)a5
{
  -[_UIPointerArbitrating exitRegion:removeStyle:completion:](self->_core, "exitRegion:removeStyle:completion:", a3, a4, a5);
}

- (int64_t)pointerState
{
  return -[_UIPointerArbitrating pointerState](self->_core, "pointerState");
}

- (void)beginScrollingWithRegion:(id)a3
{
  -[_UIPointerArbitrating beginScrollingWithRegion:](self->_core, "beginScrollingWithRegion:", a3);
}

- (void)endScrollingWithRegion:(id)a3
{
  -[_UIPointerArbitrating endScrollingWithRegion:](self->_core, "endScrollingWithRegion:", a3);
}

- (id)obtainPointerUpdatePauseAssertion
{
  return (id)-[_UIPointerArbitrating obtainPointerUpdatePauseAssertion](self->_core, "obtainPointerUpdatePauseAssertion");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_core, 0);
}

@end
