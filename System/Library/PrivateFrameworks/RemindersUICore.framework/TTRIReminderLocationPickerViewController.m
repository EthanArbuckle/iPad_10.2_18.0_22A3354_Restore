@implementation TTRIReminderLocationPickerViewController

- (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController *)sub_1B4483FC0(a3);
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_keyboardHideDeferredHandlingTimer);
  v5 = self;
  if (v4)
    objc_msgSend(v4, sel_invalidate);
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[TTRIReminderLocationPickerViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentViewMinHeightConstraint));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_searchBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_mapDragRadiusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_dragViewCircleColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_dragViewHandleColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_keyboardHideDeferredHandlingTimer));
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v2;

  v2 = self;
  sub_1B4484458();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v4;

  v4 = self;
  sub_1B4484B30(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v4;

  v4 = self;
  sub_1B4485B64(a3);

}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  v5 = a3;
  -[TTRIReminderLocationPickerViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_, v5);
  if (v5)

  else
    sub_1B447DF98();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[TTRIReminderLocationPickerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_searchBar];
  if (v5)
  {
    objc_msgSend(v5, sel_resignFirstResponder, v6.receiver, v6.super_class);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[TTRIReminderLocationPickerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1B4486058(0, 0.0);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_viewModel))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1B44862E8((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v14;
  uint64_t v15;

  v8 = sub_1B4903CB0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1B4488B20(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v11;
  uint64_t v12;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  sub_1B4486678(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v10;

  v6 = sub_1B4906A64();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1B447C5A4(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B4488DD8();

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v5;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v6;
  id v7;

  v7 = (id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_bottomControlsContainerView, a2);
  if (v7)
  {
    v5 = a3;
    v6 = self;
    objc_msgSend(v7, sel_setAccessibilityElementsHidden_, 0);

  }
  else
  {
    __break(1u);
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v6;
  void *v7;
  void *v8;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1B4488EC8();
  v8 = v7;

  swift_unknownObjectRelease();
  return v8;
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  sub_1B44869E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_mapView_regionWillChangeAnimated_);
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  sub_1B44869E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_mapView_regionDidChangeAnimated_);
}

- (void)mapDragRadiusView:(id)a3 didUpdateRegion:(id)a4
{
  id v6;
  id v7;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B447D4C4(v7);

}

- (UIView)contentView
{
  return (UIView *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentView, a2);
}

- (void)setContentView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSLayoutConstraint)contentViewMinHeightConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentViewMinHeightConstraint));
}

- (void)setContentViewMinHeightConstraint:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentViewMinHeightConstraint);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentViewMinHeightConstraint) = (Class)a3;
  v3 = a3;

}

- (UITableView)tableView
{
  return (UITableView *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_tableView, a2);
}

- (void)setTableView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIView)bottomControlsContainerView
{
  return (UIView *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_bottomControlsContainerView, a2);
}

- (void)setBottomControlsContainerView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIView)mapAndDragRadiusContainerView
{
  return (UIView *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_mapAndDragRadiusContainerView, a2);
}

- (void)setMapAndDragRadiusContainerView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (MKMapView)mapView
{
  return (MKMapView *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_mapView, a2);
}

- (void)setMapView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UISegmentedControl)alarmProximitySegmentedControl
{
  return (UISegmentedControl *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_alarmProximitySegmentedControl, a2);
}

- (void)setAlarmProximitySegmentedControl:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIBarButtonItem)doneButton
{
  return (UIBarButtonItem *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_doneButton, a2);
}

- (void)setDoneButton:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)didTapCancel:(id)a3
{
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v4;
  void *v5;
  id v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  v5 = *(Class *)((char *)&v4->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_cancelButton);
  v6 = v5;
  sub_1B447D9B0((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v7);
}

- (void)didTapDone:(id)a3
{
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  sub_1B447DF98();
  sub_1B447DE80();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void)alarmProximitySegmentedControlDidChange:(id)a3
{
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  sub_1B4486D18();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void)stopHoldingCurrentContentViewHeight
{
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v2;

  v2 = self;
  sub_1B44875E4();

}

- (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *result;

  v4 = a4;
  result = (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B447D720();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void *v5;
  id v6;
  _TtC15RemindersUICore40TTRIReminderLocationPickerViewController *v7;
  id v8;

  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_cancelButton);
  v8 = v5;
  v6 = a3;
  v7 = self;
  sub_1B447D9B0((uint64_t)v5);

}

@end
