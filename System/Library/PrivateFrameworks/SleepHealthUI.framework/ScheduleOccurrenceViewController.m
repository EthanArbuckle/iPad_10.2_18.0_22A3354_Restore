@implementation ScheduleOccurrenceViewController

- (void)viewDidLoad
{
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v2;

  v2 = self;
  sub_1A9B8B230();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v4;

  v4 = self;
  sub_1A9B8D0A8(a3);

}

- (void)handleAppWillResignActive
{
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v2;

  v2 = self;
  sub_1A9B8D480();

}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A9B8D644((uint64_t)v4);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v12;
  char v13;
  uint64_t v15;

  v6 = sub_1A9CE64E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE64BC();
  v11 = a3;
  v12 = self;
  sub_1A9B930A0();
  LOBYTE(self) = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v12;
  uint64_t v13;

  v6 = sub_1A9CE64E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE64BC();
  v11 = a3;
  v12 = self;
  sub_1A9B8D854(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
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
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v15;
  uint64_t v16;

  v8 = sub_1A9CE64E0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE64BC();
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1A9B931AC(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A9B8E05C(v6, a4);

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A9B93598(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A9B93718(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A9B9388C(a4);

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A9B93A00(a4);

  return v8;
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
  sub_1A9B94974((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_sleepScheduleProvider, &qword_1EEB42FD0, (uint64_t)&unk_1EEB42FD8, (uint64_t)&protocol descriptor for SleepScheduleProviding);
  sub_1A9B94894((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_dataSource));
}

- (void)handleSignificantTimeChange
{
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v2;

  v2 = self;
  sub_1A9B8E990("[%{public}s] Significant time changed");

}

- (void)handleLocaleDidChange
{
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v2;

  v2 = self;
  sub_1A9B8EB60();

}

- (void)cancelButtonPressed
{
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v2;

  v2 = self;
  sub_1A9B8ED8C();

}

- (void)sleepScheduleComponentsEditViewEditingDidChange:(id)a3
{
  id v4;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v5;

  v4 = a3;
  v5 = self;
  ScheduleOccurrenceViewController.sleepScheduleComponentsEditViewEditingDidChange(_:)((uint64_t)v4);

}

- (void)sleepScheduleComponentsEditViewEditingDidEnd:(id)a3
{
  id v4;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v5;

  v4 = a3;
  v5 = self;
  ScheduleOccurrenceViewController.sleepScheduleComponentsEditViewEditingDidEnd(_:)((uint64_t)v4);

}

- (void)scheduleDayPickerDidChange:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v8;

  v5 = (char *)a3 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model;
  swift_beginAccess();
  v6 = *((_QWORD *)v5 + 2);
  v7 = a3;
  v8 = self;
  ScheduleOccurrenceEditModel.weekdays.setter(v6);

}

- (void)scheduleOccurrenceAlarmVolumeEditingDidEnd:(id)a3
{
  UISlider *v4;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v5;

  v4 = (UISlider *)a3;
  v5 = self;
  ScheduleOccurrenceViewController.scheduleOccurrenceAlarmVolumeEditingDidEnd(_:)(v4);

}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  id v6;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v7;
  id v8;

  if (a3)
  {
    type metadata accessor for ScheduleOccurrenceAlarmEnabledTableViewCell();
    if (swift_dynamicCastClass())
    {
      self;
      v6 = a3;
      ScheduleOccurrenceEditModel.alarmEnabled.setter(a4);
      sub_1A9CA17A4();
    }
    else
    {
      type metadata accessor for ScheduleOccurrenceAlarmSnoozeTableViewCell();
      if (!swift_dynamicCastClass())
        return;
      v7 = self;
      v8 = a3;
      ScheduleOccurrenceEditModel.allowsSnooze.setter(a4);
    }

  }
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  sub_1A9B900D0(self, (uint64_t)a2, a3, (uint64_t)a4, "[%{public}s] Did select tone with identifier: %{public}s", (uint64_t (*)(uint64_t, uint64_t))ScheduleOccurrenceEditModel.toneIdentifier.setter);
}

- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4
{
  id v6;
  id v7;
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v8;

  if (a4)
  {
    v6 = a3;
    v8 = self;
    v7 = a4;
    objc_msgSend(v7, sel_setShowsEditButtonInNavigationBar_, 1);
    objc_msgSend(v7, sel_setDelegate_, v8);

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
  sub_1A9B900D0(self, (uint64_t)a2, a3, (uint64_t)a4, "[%{public}s] Did select vibration with identifier: %{public}s", (uint64_t (*)(uint64_t, uint64_t))ScheduleOccurrenceEditModel.vibrationIdentifier.setter);
}

- (void)saveButtonPressed
{
  _TtC13SleepHealthUI32ScheduleOccurrenceViewController *v2;

  v2 = self;
  ScheduleOccurrenceViewController.saveButtonPressed()();

}

@end
