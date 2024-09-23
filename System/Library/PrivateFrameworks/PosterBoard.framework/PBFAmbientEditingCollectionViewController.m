@implementation PBFAmbientEditingCollectionViewController

- (FBSDisplayConfiguration)displayConfiguration
{
  void *v3;
  PBFAmbientEditingCollectionViewController *v4;
  id v5;
  id v6;
  PBFAmbientEditingCollectionViewController *v7;
  id v8;
  id v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PBFAmbientEditingCollectionViewController__displayConfiguration);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0D23100]);
    v7 = self;
    v8 = objc_msgSend(v6, sel_init);
    v5 = objc_msgSend(v8, sel_mainConfiguration);

    v3 = 0;
  }
  v9 = v3;

  return (FBSDisplayConfiguration *)v5;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v4;
  PBFAmbientEditingCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  AmbientEditingCollectionViewController.displayConfiguration.setter(v4);

}

- (PBFAmbientEditingCollectionViewController)init
{
  void *v3;
  PBFAmbientEditingCollectionViewController *v4;
  id v5;
  id v6;
  id v7;
  char *v8;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedInstance);
  v6 = objc_msgSend(v5, sel_dataStore);

  v7 = objc_allocWithZone((Class)type metadata accessor for AmbientEditingCollectionViewController());
  v8 = sub_1CBB17DA8(v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (PBFAmbientEditingCollectionViewController *)v8;
}

- (id)init:(id)a3
{
  void *v5;
  id v6;
  PBFAmbientEditingCollectionViewController *v7;
  id v8;
  id v9;
  id v10;
  char *v11;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_sharedInstance);
  v9 = objc_msgSend(v8, sel_dataStore);

  v10 = objc_allocWithZone((Class)type metadata accessor for AmbientEditingCollectionViewController());
  v11 = sub_1CBB18430(v9, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (PBFAmbientEditingCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CBB25144();
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AmbientEditingCollectionViewController();
  v2 = v6.receiver;
  -[PBFAmbientEditingCollectionViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_1CBB1A608();
    sub_1CBB1A7B4();

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AmbientEditingCollectionViewController();
  v2 = v3.receiver;
  -[PBFAmbientEditingCollectionViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  sub_1CBB1B2E0();

}

- (void)viewDidLayoutSubviews
{
  PBFAmbientEditingCollectionViewController *v2;

  v2 = self;
  AmbientEditingCollectionViewController.viewDidLayoutSubviews()();

}

- (PBFAmbientEditingCollectionViewControllerDelegate)ambientEditingDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PBFAmbientEditingCollectionViewController_ambientEditingDelegate;
  swift_beginAccess();
  return (PBFAmbientEditingCollectionViewControllerDelegate *)(id)MEMORY[0x1D17A3DF0](v2);
}

- (void)setAmbientEditingDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (UIView)transitionOverlayView
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR___PBFAmbientEditingCollectionViewController_transitionOverlayView);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setTransitionOverlayView:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___PBFAmbientEditingCollectionViewController_transitionOverlayView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)dismiss
{
  PBFAmbientEditingCollectionViewController *v2;

  v2 = self;
  AmbientEditingCollectionViewController.dismiss()();

}

- (void)pageControlDidChangePage:(id)a3
{
  id v4;
  PBFAmbientEditingCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB1F630((uint64_t)objc_msgSend(v4, sel_currentPage), 1);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  unint64_t *v5;
  unint64_t v6;
  int64_t v7;
  id v9;
  PBFAmbientEditingCollectionViewController *v10;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR___PBFAmbientEditingCollectionViewController_posters);
  swift_beginAccess();
  v6 = *v5;
  if (!(v6 >> 62))
    return *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  v7 = sub_1CBB82AE4();

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  PBFAmbientEditingCollectionViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1CBB8234C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CBB822F8();
  v10 = a3;
  v11 = self;
  v12 = AmbientEditingCollectionViewController.collectionView(_:cellForItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  PBFAmbientEditingCollectionViewController *v15;
  void *v16;
  uint64_t v18;

  v7 = sub_1CBB8234C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CBB824CC();
  v13 = v12;
  sub_1CBB822F8();
  v14 = a3;
  v15 = self;
  v16 = (void *)AmbientEditingCollectionViewController.collectionView(_:viewForSupplementaryElementOfKind:at:)(v14, v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  PBFAmbientEditingCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_1CBB8234C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CBB822F8();
  v10 = a3;
  v11 = self;
  AmbientEditingCollectionViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  PBFAmbientEditingCollectionViewController *v14;
  uint64_t v15;

  v8 = sub_1CBB8234C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CBB822F8();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1CBB25388(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  PBFAmbientEditingCollectionViewController *v14;
  uint64_t v15;

  v8 = sub_1CBB8234C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CBB822F8();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1CBB25498(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  PBFAmbientEditingCollectionViewController *v17;

  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = self;
  AmbientEditingCollectionViewController.editingSceneViewController(_:userDidDismissWith:updatedConfiguration:updatedConfiguredProperties:completion:)(v14, a4, a5, a6, (uint64_t)sub_1CBB262A4, v13);

  swift_release();
}

- (void)editingSceneViewController:(id)a3 wantsRemotePresentationOfViewController:(id)a4 contentScreenRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  PBFAmbientEditingCollectionViewController *v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_1CBB1E414(v12, x, y, width, height);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  PBFAmbientEditingCollectionViewController *v5;

  if ((*((_BYTE *)&self->super.super.super.super.isa
        + OBJC_IVAR___PBFAmbientEditingCollectionViewController_isScrollingOrSettling) & 1) == 0)
  {
    v4 = a3;
    v5 = self;
    sub_1CBB1F3E8((char)objc_msgSend(v4, sel_isScrollAnimating));

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR___PBFAmbientEditingCollectionViewController_isScrollingOrSettling) = 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  PBFAmbientEditingCollectionViewController *v8;

  v7 = a3;
  v8 = self;
  sub_1CBB25BEC(&a5->x);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  PBFAmbientEditingCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB25DBC();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  PBFAmbientEditingCollectionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1CBB25F9C(a4);

}

- (void)posterExtensionDataStore:(id)a3 didAddConfiguration:(id)a4
{
  sub_1CBB23928(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1E86F9920, (uint64_t)sub_1CBB26668, (uint64_t)&block_descriptor_97);
}

- (void)posterExtensionDataStore:(id)a3 didDeleteConfiguration:(id)a4
{
  sub_1CBB23928(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1E86F98D0, (uint64_t)sub_1CBB26664, (uint64_t)&block_descriptor_90);
}

- (void)posterExtensionDataStore:(id)a3 didUpdateConfiguration:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  PBFAmbientEditingCollectionViewController *v10;
  id v11;
  PBFAmbientEditingCollectionViewController *v12;
  id v13;
  _QWORD v14[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a4;
  *(_QWORD *)(v7 + 24) = self;
  v14[4] = sub_1CBB26588;
  v14[5] = v7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_1CBB0CA34;
  v14[3] = &block_descriptor_83;
  v8 = _Block_copy(v14);
  v9 = a4;
  v10 = self;
  v11 = v9;
  v12 = v10;
  v13 = a3;
  swift_release();
  BSDispatchMain();
  _Block_release(v8);

}

- (void)invalidate
{
  void **v3;
  void *v4;
  PBFAmbientEditingCollectionViewController *v5;
  void *v6;

  v3 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___PBFAmbientEditingCollectionViewController_transitionOverlayView);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  objc_msgSend(v4, sel_removeFromSuperview);
  v6 = *v3;
  *v3 = 0;

}

- (PBFAmbientEditingCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  PBFAmbientEditingCollectionViewController *result;

  v3 = a3;
  result = (PBFAmbientEditingCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PBFAmbientEditingCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PBFAmbientEditingCollectionViewController *result;

  v4 = a4;
  result = (PBFAmbientEditingCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController__displayConfiguration));
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR___PBFAmbientEditingCollectionViewController_ambientEditingDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_transitionOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_dataStore));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_activePosterConfiguration));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_pageControl));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController____lazy_storage___snapshotController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_editingSceneHiddenWindow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_editingSceneViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_presentedEditingRemoteViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFAmbientEditingCollectionViewController_observers));
}

@end
