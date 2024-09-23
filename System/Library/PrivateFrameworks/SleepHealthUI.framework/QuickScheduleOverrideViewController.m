@implementation QuickScheduleOverrideViewController

- (_TtC13SleepHealthUI35QuickScheduleOverrideViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9BF7F2C();
}

- (void)viewDidLoad
{
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v2;

  v2 = self;
  sub_1A9BF00B0();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for QuickScheduleOverrideViewController();
  v4 = v5.receiver;
  -[QuickScheduleOverrideViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_1A9CA17A4();

}

- (void)handleAppWillResignActive
{
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v2;

  v2 = self;
  sub_1A9BF1C24();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v15;
  uint64_t v16;

  v8 = sub_1A9CE64E0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE64BC();
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1A9BF1EB4(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v12;
  uint64_t v13;

  v6 = sub_1A9CE64E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE64BC();
  v11 = a3;
  v12 = self;
  sub_1A9BF8064();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v12;
  char v13;
  uint64_t v15;

  v6 = sub_1A9CE64E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE64BC();
  v11 = a3;
  v12 = self;
  sub_1A9BF824C();
  LOBYTE(self) = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A9BF2648(v6, a4);

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A9BF85A8(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A9BF87A8(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A9BF89AC(a4);

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  void *v4;
  id v7;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_dataSource);
  if (!v4)
    return 10.0;
  v7 = a3;
  v8 = self;
  v9 = v4;
  sub_1A9BF83DC(a4);
  v11 = v10;

  if (v11)
  {
    swift_bridgeObjectRelease();
    if (qword_1EEB42D40 != -1)
      swift_once();
    v12 = *(double *)&qword_1EEB47F98;
  }
  else
  {
    v12 = 10.0;
  }

  return v12;
}

- (_TtC13SleepHealthUI35QuickScheduleOverrideViewController)initWithStyle:(int64_t)a3
{
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *result;

  result = (_TtC13SleepHealthUI35QuickScheduleOverrideViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUI35QuickScheduleOverrideViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *result;

  v4 = a4;
  result = (_TtC13SleepHealthUI35QuickScheduleOverrideViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_sleepScheduleProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1A9B94894((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_dataSource));
}

- (void)handleSignificantTimeChange
{
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v2;

  v2 = self;
  sub_1A9BF31F8();

}

- (void)saveButtonPressed
{
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v2;

  v2 = self;
  sub_1A9BF3584();

}

- (void)cancelButtonPressed
{
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v7;

  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate;
  v4 = MEMORY[0x1AF4203E0]((char *)self + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate, a2);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *((_QWORD *)v3 + 1);
    v7 = self;
    sub_1A9BF58BC(v5, v6, (uint64_t)v7);
    *((_QWORD *)v3 + 1) = 0;
    swift_unknownObjectWeakAssign();

    swift_unknownObjectRelease();
  }
}

- (void)sleepScheduleComponentsEditViewEditingDidChange:(id)a3
{
  id v4;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A9BF593C((uint64_t)v4);

}

- (void)sleepScheduleComponentsEditViewEditingDidEnd:(id)a3
{
  id v4;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A9BF5C60((uint64_t)v4);

}

- (void)scheduleOccurrenceAlarmVolumeEditingDidEnd:(id)a3
{
  id v4;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A9BF66C4(v4);

}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  id v7;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v8;

  v7 = a3;
  v8 = self;
  sub_1A9BF6950((uint64_t)a3, a4);

}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  sub_1A9BF6B68(self, (uint64_t)a2, a3, (uint64_t)a4, "[%{public}s] Did select tone with identifier: %{public}s", ScheduleOccurrenceEditModel.toneIdentifier.setter);
}

- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _TtC13SleepHealthUI35QuickScheduleOverrideViewController *v9;

  if (a4)
  {
    v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_vibrationPickerStyleProvider);
    v7 = a3;
    v9 = self;
    v8 = a4;
    objc_msgSend(v8, sel_setStyleProvider_, v6);
    objc_msgSend(v8, sel_setShowsEditButtonInNavigationBar_, 1);
    objc_msgSend(v8, sel_setDelegate_, v9);

  }
  else
  {
    __break(1u);
  }
}

- (void)tonePickerViewController:(id)a3 didDismissVibrationPickerViewController:(id)a4
{
  if (a4)
    objc_msgSend(a4, sel_setDelegate_, self);
  else
    __break(1u);
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
  sub_1A9BF6B68(self, (uint64_t)a2, a3, (uint64_t)a4, "[%{public}s] Did select vibration with identifier: %{public}s", ScheduleOccurrenceEditModel.vibrationIdentifier.setter);
}

@end
