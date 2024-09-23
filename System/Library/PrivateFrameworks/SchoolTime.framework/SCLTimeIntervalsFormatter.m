@implementation SCLTimeIntervalsFormatter

- (SCLTimeIntervalsFormatter)init
{
  SCLTimeIntervalsFormatter *v2;
  SCLScheduleIntervalFormatter *v3;
  SCLScheduleIntervalFormatter *intervalFormatter;
  NSListFormatter *v5;
  NSListFormatter *listFormatter;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCLTimeIntervalsFormatter;
  v2 = -[SCLTimeIntervalsFormatter init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SCLScheduleIntervalFormatter);
    intervalFormatter = v2->_intervalFormatter;
    v2->_intervalFormatter = v3;

    -[SCLScheduleIntervalFormatter setFormattingStyle:](v2->_intervalFormatter, "setFormattingStyle:", 1);
    v5 = (NSListFormatter *)objc_alloc_init(MEMORY[0x24BDD1640]);
    listFormatter = v2->_listFormatter;
    v2->_listFormatter = v5;

    -[NSListFormatter setItemFormatter:](v2->_listFormatter, "setItemFormatter:", v2->_intervalFormatter);
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLTimeIntervalsFormatter setLocale:](v2, "setLocale:", v7);

  }
  return v2;
}

- (NSLocale)locale
{
  return -[SCLScheduleIntervalFormatter locale](self->_intervalFormatter, "locale");
}

- (void)setLocale:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  -[SCLScheduleIntervalFormatter setLocale:](self->_intervalFormatter, "setLocale:", v4);
  -[NSListFormatter setLocale:](self->_listFormatter, "setLocale:", v5);

}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCLTimeIntervalsFormatter stringFromTimeIntervals:](self, "stringFromTimeIntervals:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stringFromTimeIntervals:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ScheduleOff"), &stru_24E29C4C8, CFSTR("SchoolTimeFormatters"));
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = (void *)v14;
    goto LABEL_7;
  }
  v5 = objc_msgSend(v4, "count");
  -[SCLTimeIntervalsFormatter intervalFormatter](self, "intervalFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 != 1)
  {
    objc_msgSend(v6, "setPrefersHoursOnly:", 1);

    -[SCLTimeIntervalsFormatter intervalFormatter](self, "intervalFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCoalescesAMPMSymbols:", 0);

    -[SCLTimeIntervalsFormatter listFormatter](self, "listFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromItems:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v6, "setPrefersHoursOnly:", -[SCLTimeIntervalsFormatter prefersHoursOnly](self, "prefersHoursOnly"));

  -[SCLTimeIntervalsFormatter intervalFormatter](self, "intervalFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoalescesAMPMSymbols:", 0);

  objc_msgSend(v4, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTimeIntervalsFormatter intervalFormatter](self, "intervalFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromTime:toTime:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v13;
}

- (unint64_t)intervalFormattingStyle
{
  return -[SCLScheduleIntervalFormatter formattingStyle](self->_intervalFormatter, "formattingStyle");
}

- (void)setIntervalFormattingStyle:(unint64_t)a3
{
  -[SCLScheduleIntervalFormatter setFormattingStyle:](self->_intervalFormatter, "setFormattingStyle:", a3);
}

- (BOOL)prefersHoursOnly
{
  return self->_prefersHoursOnly;
}

- (void)setPrefersHoursOnly:(BOOL)a3
{
  self->_prefersHoursOnly = a3;
}

- (SCLScheduleIntervalFormatter)intervalFormatter
{
  return self->_intervalFormatter;
}

- (NSListFormatter)listFormatter
{
  return self->_listFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listFormatter, 0);
  objc_storeStrong((id *)&self->_intervalFormatter, 0);
}

@end
