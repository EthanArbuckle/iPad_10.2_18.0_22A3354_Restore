@implementation TTRISmartListFilterEditorRelativeRangeTableCell

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 3;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  _TtC9Reminders47TTRISmartListFilterEditorRelativeRangeTableCell *v10;
  double result;
  double v12;

  v6 = qword_10064F730;
  v7 = *(_QWORD *)((char *)self + qword_10064F730);
  v8 = *(_QWORD *)(v7 + 16);
  v9 = a3;
  v10 = self;
  if (v8 <= 2)
  {
    sub_100242B74();
    v7 = *(_QWORD *)((char *)self + v6);
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v7 + 16) > (unint64_t)a4)
  {
    v12 = *(double *)(v7 + 8 * a4 + 32);

    return v12;
  }
  __break(1u);
  return result;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return sub_100244C3C(a4);
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _TtC9Reminders47TTRISmartListFilterEditorRelativeRangeTableCell *v16;
  id v17;
  id v18;
  _TtC9Reminders47TTRISmartListFilterEditorRelativeRangeTableCell *v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;

  if (a6 && (v11 = objc_opt_self(UILabel), (v12 = swift_dynamicCastObjCClass(a6, v11)) != 0))
  {
    v13 = (id)v12;
    v14 = a6;
    v15 = a3;
    v16 = self;
  }
  else
  {
    v17 = a6;
    v18 = a3;
    v19 = self;
    v13 = sub_1002437C8(a5);
  }
  sub_1002438D8(a4, a5);
  v21 = v20;
  v22 = String._bridgeToObjectiveC()();
  objc_msgSend(v13, "setText:", v22, swift_bridgeObjectRelease(v21).n128_f64[0]);

  return v13;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6;
  _TtC9Reminders47TTRISmartListFilterEditorRelativeRangeTableCell *v7;

  v6 = a3;
  v7 = self;
  sub_100244C80();

}

@end
