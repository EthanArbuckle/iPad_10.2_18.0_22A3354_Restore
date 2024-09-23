@implementation RPTBlockInteraction

- (RPTBlockInteraction)initWithActions:(id)a3
{
  id v4;
  RPTBlockInteraction *v5;
  uint64_t v6;
  id actionsComposer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPTBlockInteraction;
  v5 = -[RPTBlockInteraction init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1B5E1F6E0](v4);
    actionsComposer = v5->_actionsComposer;
    v5->_actionsComposer = (id)v6;

  }
  return v5;
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  id v5;
  void (**v6)(id, id);

  v5 = a3;
  -[RPTBlockInteraction actionsComposer](self, "actionsComposer");
  v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5);

}

- (id)actionsComposer
{
  return self->_actionsComposer;
}

- (void)setActionsComposer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionsComposer, 0);
}

@end
