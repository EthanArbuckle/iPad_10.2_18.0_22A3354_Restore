@implementation ProvisioningSetupAssistantFlowRenderer

- (PKUIFlowManagerRendererDelegate)flowDelegate
{
  return (PKUIFlowManagerRendererDelegate *)(id)MEMORY[0x1A1AE6A68](self->flowDelegate, a2);
}

- (void)setFlowDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)pushWithViewController:(id)a3 animated:(BOOL)a4
{
  id v5;

  v5 = a3;
  sub_19DE82CB0();
  sub_19D30AE50(v5, a4);

  swift_release();
}

- (void)presentWithViewController:(id)a3 animated:(BOOL)a4
{
  id v4;

  v4 = a3;
  sub_19DE82CB0();
  sub_19D30C230(v4);

  swift_release();
}

- (void)dismissWithViewController:(id)a3 animated:(BOOL)a4
{
  void *v4;

  v4 = *(void **)self->navController;
  if (v4)
    objc_msgSend(v4, sel_dismissWithViewController_animated_, a3, a4);
}

- (id)navViewControllers
{
  void *v2;

  swift_beginAccess();
  sub_19D1A9ED4(0, (unint64_t *)&qword_1EE49CE90);
  sub_19DE82F08();
  v2 = (void *)sub_19DE87DF8();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v5;

  v4 = a4;
  sub_19D1A9ED4(0, (unint64_t *)&qword_1EE49CE90);
  v5 = sub_19DE87E10();
  sub_19DE82CB0();
  sub_19D30B068(v5, v4);
  swift_release();
  swift_bridgeObjectRelease();
}

- (id)createChildRenderer
{
  id v2;
  id v3;

  v2 = objc_allocWithZone(MEMORY[0x1E0DC3A40]);
  sub_19DE82CB0();
  v3 = objc_msgSend(v2, sel_init);
  swift_release();
  return v3;
}

- (id)rootViewController
{
  void *v2;
  id v3;
  id v4;
  id v5;

  v2 = *(void **)self->navController;
  if (v2)
  {
    sub_19DE82CB0();
    v3 = v2;
  }
  else
  {
    v4 = objc_allocWithZone(MEMORY[0x1E0DC3A40]);
    sub_19DE82CB0();
    v3 = objc_msgSend(v4, sel_init);
  }
  v5 = v2;
  swift_release();
  return v3;
}

@end
