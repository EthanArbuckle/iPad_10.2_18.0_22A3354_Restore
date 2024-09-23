@implementation SESecureCaptureSceneViewController

- (FBScene)_scene
{
  return (FBScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___SESecureCaptureSceneViewController_scene));
}

- (unint64_t)presentationMode
{
  unint64_t result;
  SESecureCaptureSceneViewController *v3;

  if (*(_DWORD *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode) < 3u)
    return *(unsigned int *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
  v3 = self;
  result = sub_245BD8EDC();
  __break(1u);
  return result;
}

- (void)setPresentationMode:(unint64_t)a3
{
  int v3;
  SESecureCaptureSceneViewController *v4;

  if (a3 == 2)
    v3 = 2;
  else
    v3 = a3 == 1;
  v4 = self;
  BSDispatchQueueAssertMain();
  sub_245BCD350(v3, 0);

}

- (BOOL)requestsIdleTimerDisabled
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled);
}

- (SESecureCaptureSceneViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___SESecureCaptureSceneViewController_delegate;
  swift_beginAccess();
  return (SESecureCaptureSceneViewControllerDelegate *)(id)MEMORY[0x24954361C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (LCSExtensionDescribing)extensionProvider
{
  swift_beginAccess();
  return (LCSExtensionDescribing *)(id)swift_unknownObjectRetain();
}

- (void)setExtensionProvider:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SESecureCaptureSceneViewController_extensionProvider);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (SESecureCaptureSceneViewController)initWithProvider:(id)a3
{
  void *v5;
  SESecureCaptureSceneViewController *v6;

  swift_unknownObjectRetain();
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_245BD8E70())
    sub_245BCB8A4(MEMORY[0x24BEE4AF8]);
  sub_245BC4B08(0, &qword_2575129F8);
  sub_245BC49B4();
  v5 = (void *)sub_245BD8BF4();
  swift_bridgeObjectRelease();
  v6 = -[SESecureCaptureSceneViewController initWithProvider:launchActions:](self, sel_initWithProvider_launchActions_, a3, v5);

  swift_unknownObjectRelease();
  return v6;
}

- (SESecureCaptureSceneViewController)initWithProvider:(id)a3 launchActions:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_245BC4B08(0, &qword_2575129F8);
  sub_245BC49B4();
  v4 = sub_245BD8C00();
  v5 = swift_unknownObjectRetain();
  return (SESecureCaptureSceneViewController *)SESecureCaptureSceneViewController.init(provider:launch:)(v5, v4);
}

- (SESecureCaptureSceneViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  SESecureCaptureSceneViewController *v3;
  _QWORD v4[3];
  objc_super v5;

  sub_245BD8BB8();
  v4[2] = self;
  v3 = self;
  sub_245BCE180((void (*)(void))sub_245BD4C88, (uint64_t)v4);
  v5.receiver = v3;
  v5.super_class = (Class)SESecureCaptureSceneViewController;
  -[SESecureCaptureSceneViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue));
  sub_245BD4CB0((uint64_t)self + OBJC_IVAR___SESecureCaptureSceneViewController_delegate);
  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  SESecureCaptureSceneViewController *v2;
  objc_super v3;

  v2 = self;
  BSDispatchQueueAssertMain();
  v3.receiver = v2;
  v3.super_class = (Class)SESecureCaptureSceneViewController;
  -[SESecureCaptureSceneViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_245BCE4A8();

}

- (void)invalidate
{
  SESecureCaptureSceneViewController *v2;

  v2 = self;
  SESecureCaptureSceneViewController.invalidate()();

}

- (SESecureCaptureSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  SESecureCaptureSceneViewController *result;

  v4 = a4;
  result = (SESecureCaptureSceneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  SESecureCaptureSceneViewController *v5;

  v4 = a3;
  v5 = self;
  SESecureCaptureSceneViewController.sceneDidActivate(_:)(v4);

}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  SESecureCaptureSceneViewController *v5;

  v4 = a3;
  v5 = self;
  _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE18sceneDidInvalidateyySo7FBSceneCF_0();

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  SESecureCaptureSceneViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  SESecureCaptureSceneViewController.sceneDidDeactivate(_:withError:)(v6, a4);

}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  SESecureCaptureSceneViewController *v5;

  v4 = a3;
  v5 = self;
  SESecureCaptureSceneViewController.sceneContentStateDidChange(_:)(v4);

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v6;
  id v7;
  SESecureCaptureSceneViewController *v8;

  sub_245BC4B08(0, &qword_2575129F8);
  sub_245BC49B4();
  v6 = sub_245BD8C00();
  v7 = a3;
  v8 = self;
  sub_245BD3CB4(v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SESecureCaptureSceneViewController *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE5scene_27didUpdateClientSettingsWith03oldkL017transitionContextySo7FBSceneC_So08FBSScenekL4DiffCSo0rkL0CSo0r10TransitionP0CSgtF_0(v10, v11);

}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  sub_245BD32F0(self, (uint64_t)a2, a3, "Capture Scene sceneLayerManagerDidUpdateLayers");
}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
  sub_245BD32F0(self, (uint64_t)a2, a3, "Capture Scene sceneLayerManagerDidStopTrackingLayers");
}

- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3
{
  sub_245BD32F0(self, (uint64_t)a2, a3, "Capture Scene sceneLayerManagerDidStartTrackingLayers");
}

@end
