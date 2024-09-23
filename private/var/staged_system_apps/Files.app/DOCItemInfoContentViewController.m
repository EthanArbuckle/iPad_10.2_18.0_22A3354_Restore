@implementation DOCItemInfoContentViewController

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_layoutMargins);
  v3 = *(double *)&self->configuration[OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_layoutMargins];
  v4 = *(double *)&self->actionManager[OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_layoutMargins];
  v5 = *(double *)&self->documentManager[OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_layoutMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_layoutMargins) = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_rootContentView), "setLayoutMargins:");
}

- (_TtP5Files34DOCBrowserContainedActionReporting_)actionReporting
{
  return (_TtP5Files34DOCBrowserContainedActionReporting_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_actionReporting, a2);
}

- (void)setActionReporting:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_actionReporting, a3);
}

- (_TtP5Files30DOCItemInfoContentTagsDelegate_)tagsWorkflowDelegate
{
  return (_TtP5Files30DOCItemInfoContentTagsDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_tagsWorkflowDelegate, a2);
}

- (void)setTagsWorkflowDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_tagsWorkflowDelegate, a3);
}

- (BOOL)showsShareButton
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_showsShareButton);
}

- (void)setShowsShareButton:(BOOL)a3
{
  _TtC5Files32DOCItemInfoContentViewController *v4;

  v4 = self;
  sub_100223594(a3);

}

- (BOOL)showsItemLocation
{
  _TtC5Files32DOCItemInfoContentViewController *v2;
  _BYTE *v3;
  char v4;

  v2 = self;
  v3 = sub_100090C80(&OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___metadataView, (uint64_t (*)(uint64_t))sub_1002245D8);
  v4 = v3[OBJC_IVAR____TtC5Files15DOCMetadataView_showsItemLocation];

  return v4;
}

- (void)setShowsItemLocation:(BOOL)a3
{
  int v3;
  _TtC5Files32DOCItemInfoContentViewController *v4;
  unsigned __int8 *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = self;
  v5 = (unsigned __int8 *)sub_100090C80(&OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___metadataView, (uint64_t (*)(uint64_t))sub_1002245D8);
  v6 = v5[OBJC_IVAR____TtC5Files15DOCMetadataView_showsItemLocation];
  v7 = v5;
  v5[OBJC_IVAR____TtC5Files15DOCMetadataView_showsItemLocation] = v3;
  if (v6 != v3)
    sub_1003D26E8();

}

- (UIScrollView)scrollView
{
  _TtC5Files32DOCItemInfoContentViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100226F8C();

  return (UIScrollView *)v3;
}

- (void)setScrollView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___scrollView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___scrollView) = (Class)a3;
  v3 = a3;

}

- (_TtC5Files32DOCItemInfoContentViewController)initWithConfiguration:(id)a3 nodes:(id)a4 allowOpenButton:(BOOL)a5 documentManager:(id)a6 actionManager:(id)a7 actionDelegate:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v14 = sub_10006922C((uint64_t *)&unk_1006424B0);
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v14);
  v16 = a3;
  v17 = a6;
  v18 = a7;
  swift_unknownObjectRetain(a8);
  return (_TtC5Files32DOCItemInfoContentViewController *)sub_100227048(v16, v15, a5, a6, a7, (uint64_t)a8);
}

- (_TtC5Files32DOCItemInfoContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100231284();
}

- (void)loadView
{
  _TtC5Files32DOCItemInfoContentViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100226F8C();
  -[DOCItemInfoContentViewController setView:](v2, "setView:", v3);

}

- (void)viewDidLoad
{
  _TtC5Files32DOCItemInfoContentViewController *v2;

  v2 = self;
  DOCItemInfoContentViewController.viewDidLoad()();

}

- (void)viewWillLayoutSubviews
{
  _TtC5Files32DOCItemInfoContentViewController *v2;

  v2 = self;
  DOCItemInfoContentViewController.viewWillLayoutSubviews()();

}

- (void)viewDidLayoutSubviews
{
  _TtC5Files32DOCItemInfoContentViewController *v2;

  v2 = self;
  DOCItemInfoContentViewController.viewDidLayoutSubviews()();

}

- (double)layoutHeightForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_rootContentView), "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, UILayoutFittingCompressedSize.height, v3, v4);
  return v5;
}

- (void)doc_startPreheatIfNecessary
{
  _TtC5Files32DOCItemInfoContentViewController *v2;

  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_hasMetadataViewFinishedPreheat) == 1)
  {
    v2 = self;
    sub_100223050((uint64_t)v2);

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  v6 = v8.receiver;
  v7 = a3;
  -[DOCItemInfoContentViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, "viewDidMoveToWindow:shouldAppearOrDisappear:", v7, v4);
  if (v7)
  {
    sub_100227DA0(0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files32DOCItemInfoContentViewController *v4;

  v4 = self;
  DOCItemInfoContentViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Files32DOCItemInfoContentViewController *v4;

  v4 = self;
  DOCItemInfoContentViewController.viewDidDisappear(_:)(a3);

}

- (void)documentPreviewTappedWithSender:(id)a3
{
  id v4;
  _TtC5Files32DOCItemInfoContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100231534();

}

- (void)openSelectedItem:(id)a3
{
  uint64_t ObjectType;
  _TtC5Files32DOCItemInfoContentViewController *v6;

  ObjectType = swift_getObjectType(a3);
  swift_unknownObjectRetain(a3);
  v6 = self;
  sub_10023039C(a3, (char *)v6, ObjectType);
  swift_unknownObjectRelease(a3);

}

- (_TtC5Files32DOCItemInfoContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Files32DOCItemInfoContentViewController *result;

  v4 = a4;
  result = (_TtC5Files32DOCItemInfoContentViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCItemInfoContentViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_actionManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_documentManager));
  v3 = *(void **)&self->metrics[OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_metrics + 32];

  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_actionDelegate);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_eventReporting);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_actionReporting);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_tagsWorkflowDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___filenameTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___shareStatusLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___kindAndSizeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___syncingErrorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___downloadButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___metadataSectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___metadataTitleRowSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___metadataTitleRow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___showMoreMetadataButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___metadataView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___tagsTitleRowSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___tagsTitleRow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___tagsSectionTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___addTagsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___tagsCollectionView));
  sub_10008D9C4(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___actionsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___shareView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___actionsRow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_rootContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_attributionView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_tagViewController);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_actionsForCurrentActivityViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_nodesObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_nodes));
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files32DOCItemInfoContentViewController_rootContentView));
}

- (void)tagsCollectionItem:(id)a3 didDeleteTag:(id)a4
{
  id v6;
  id v7;
  _TtC5Files32DOCItemInfoContentViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100231730(v7);

}

- (void)tagsCollectionView:(id)a3 didSelectAddTagButton:(id)a4
{
  id v6;
  id v7;
  _TtC5Files32DOCItemInfoContentViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s5Files32DOCItemInfoContentViewControllerC014tagsCollectionE0_21didSelectAddTagButtonySo07DOCTagshE0C_So6UIViewCtF_0(v6);

}

- (void)nodeDownloadButton:(id)a3 downloadingNode:(id)a4 encounteredError:(id)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC5Files32DOCItemInfoContentViewController *v13;
  id v14;
  _TtC5Files32DOCItemInfoContentViewController *v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;

  v9 = swift_allocObject(&unk_1005D3C08, 32, 7);
  *(_QWORD *)(v9 + 16) = a5;
  *(_QWORD *)(v9 + 24) = self;
  v17[4] = sub_10023277C;
  v18 = v9;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10004A82C;
  v17[3] = &unk_1005D3C20;
  v10 = _Block_copy(v17);
  v11 = v18;
  v12 = a5;
  v13 = self;
  v14 = v12;
  v15 = v13;
  v16 = a3;
  swift_unknownObjectRetain(a4);
  swift_release(v11);
  DOCRunInMainThread(v10);
  _Block_release(v10);

  swift_unknownObjectRelease(a4);
}

- (void)nodeDownloadButton:(id)a3 requestedOpeningNode:(id)a4
{
  id v6;
  _TtC5Files32DOCItemInfoContentViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100231874(a4);

  swift_unknownObjectRelease(a4);
}

+ (BOOL)itemTapDrillsIntoNode:(id)a3
{
  unsigned __int8 v4;

  swift_unknownObjectRetain(a3);
  if (objc_msgSend(a3, "isFolder"))
  {
    v4 = objc_msgSend(a3, "doc_isCollaborationInvitation");
    swift_unknownObjectRelease(a3);
    if ((v4 & 1) == 0)
      return 1;
  }
  else
  {
    swift_unknownObjectRelease(a3);
  }
  return 0;
}

- (void)didTapAttributionView
{
  _TtC5Files32DOCItemInfoContentViewController *v2;

  v2 = self;
  sub_10022EE58();

}

@end
