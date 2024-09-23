@implementation WFAlarmTableViewCell

- (WFAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v5;
  WFAlarmTableViewCell *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;
  MTUIAlarmView *alarmView;
  void *v13;
  WFAlarmTableViewCell *v14;
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFAlarmTableViewCell;
  v6 = -[WFAlarmTableViewCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, 0, v5);
  if (v6)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v7 = (void *)getMTUIAlarmViewClass_softClass;
    v21 = getMTUIAlarmViewClass_softClass;
    if (!getMTUIAlarmViewClass_softClass)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __getMTUIAlarmViewClass_block_invoke;
      v17[3] = &unk_24E604F20;
      v17[4] = &v18;
      __getMTUIAlarmViewClass_block_invoke((uint64_t)v17);
      v7 = (void *)v19[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v18, 8);
    v9 = [v8 alloc];
    -[WFAlarmTableViewCell contentView](v6, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v11 = objc_msgSend(v9, "initWithFrame:");
    alarmView = v6->_alarmView;
    v6->_alarmView = (MTUIAlarmView *)v11;

    -[MTUIAlarmView setAutoresizingMask:](v6->_alarmView, "setAutoresizingMask:", 18);
    -[MTUIAlarmView setSwitchVisible:](v6->_alarmView, "setSwitchVisible:", 0);
    -[MTUIAlarmView setStyle:](v6->_alarmView, "setStyle:", 0);
    -[WFAlarmTableViewCell contentView](v6, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v6->_alarmView);

    v14 = v6;
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  if (*(double *)&sizeThatFits__width == a3.width)
  {
    v8 = *(double *)&sizeThatFits__result_0;
    v9 = *(double *)&sizeThatFits__result_1;
  }
  else
  {
    sizeThatFits__width = *(_QWORD *)&a3.width;
    -[WFAlarmTableViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;

    -[MTUIAlarmView effectiveLayoutSizeFittingSize:](self->_alarmView, "effectiveLayoutSizeFittingSize:", v7, height);
    sizeThatFits__result_0 = *(_QWORD *)&v8;
    sizeThatFits__result_1 = *(_QWORD *)&v9;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MTUIAlarmView *alarmView;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v5 = a3;
  self->_enabled = objc_msgSend(v5, "isEnabled");
  v6 = objc_msgSend(v5, "repeatSchedule");
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v7 = (void (*)(uint64_t))getDetailDateMaskToStringSymbolLoc_ptr;
  v22 = getDetailDateMaskToStringSymbolLoc_ptr;
  if (!getDetailDateMaskToStringSymbolLoc_ptr)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __getDetailDateMaskToStringSymbolLoc_block_invoke;
    v18[3] = &unk_24E604F20;
    v18[4] = &v19;
    __getDetailDateMaskToStringSymbolLoc_block_invoke(v18);
    v7 = (void (*)(uint64_t))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v7)
  {
    v7(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIAlarmView timeLabel](self->_alarmView, "timeLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHour:minute:", objc_msgSend(v5, "hour"), objc_msgSend(v5, "minute"));

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAlarmTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v12);

    -[MTUIAlarmView timeLabel](self->_alarmView, "timeLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v10);

    alarmView = self->_alarmView;
    objc_msgSend(v5, "displayTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIAlarmView setName:andRepeatText:textColor:](alarmView, "setName:andRepeatText:textColor:", v15, v8, v11);

    -[MTUIAlarmView setNeedsLayout](self->_alarmView, "setNeedsLayout");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull WFDetailDateMaskToString(uint32_t)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("WFAlarmTableViewCell.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (MTUIAlarmView)alarmView
{
  return self->_alarmView;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmView, 0);
}

@end
