@implementation TTRIIntervalPickerTableCell

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return *(_QWORD *)(*(_QWORD *)((char *)self + qword_1EF0AFB78) + 16);
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v5;
  id v7;
  _TtC15RemindersUICore27TTRIIntervalPickerTableCell *v8;

  if ((a4 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)((char *)self + qword_1EF0AFB70);
    if (*(_QWORD *)(v5 + 16) > (unint64_t)a4 && (*(_BYTE *)(v5 + a4 + 32) & 1) != 0)
      return 5;
  }
  v7 = a3;
  v8 = self;
  sub_1B46F9F0C();

  return 200;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC15RemindersUICore27TTRIIntervalPickerTableCell *v15;
  id v16;
  id v17;
  _TtC15RemindersUICore27TTRIIntervalPickerTableCell *v18;
  void *v19;

  if (a6 && (objc_opt_self(), (v11 = swift_dynamicCastObjCClass()) != 0))
  {
    v12 = (id)v11;
    v13 = a6;
    v14 = a3;
    v15 = self;
  }
  else
  {
    v16 = a6;
    v17 = a3;
    v18 = self;
    v12 = sub_1B46FA1B8(a5);
  }
  sub_1B46FA358(a4, a5);
  v19 = (void *)sub_1B4906A34();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setText_, v19);

  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6;
  _TtC15RemindersUICore27TTRIIntervalPickerTableCell *v7;

  v6 = a3;
  v7 = self;
  sub_1B46FAE58();

}

@end
