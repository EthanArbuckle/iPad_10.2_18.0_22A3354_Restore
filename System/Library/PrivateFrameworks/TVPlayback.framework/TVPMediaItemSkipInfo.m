@implementation TVPMediaItemSkipInfo

- (TVPMediaItemSkipInfo)initWithType:(unint64_t)a3 start:(double)a4 duration:(double)a5 target:(double)a6 localizedTitle:(id)a7 skipIntroReportingType:(id)a8
{
  id v14;
  id v15;
  TVPMediaItemSkipInfo *v16;
  TVPMediaItemSkipInfo *v17;
  uint64_t v18;
  NSString *localizedTitle;
  uint64_t v20;
  NSString *skipIntroReportingType;
  objc_super v23;

  v14 = a7;
  v15 = a8;
  v23.receiver = self;
  v23.super_class = (Class)TVPMediaItemSkipInfo;
  v16 = -[TVPMediaItemSkipInfo init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    v16->_start = a4;
    v16->_duration = a5;
    v16->_target = a6;
    v18 = objc_msgSend(v14, "copy");
    localizedTitle = v17->_localizedTitle;
    v17->_localizedTitle = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    skipIntroReportingType = v17->_skipIntroReportingType;
    v17->_skipIntroReportingType = (NSString *)v20;

  }
  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TVPMediaItemSkipInfo _typeDescription](self, "_typeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type - %@, start - %f, duration - %f target - %f"), v4, *(_QWORD *)&self->_start, *(_QWORD *)&self->_duration, *(_QWORD *)&self->_target);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_typeDescription
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[TVPMediaItemSkipInfo type](self, "type");
  v3 = CFSTR("TVPMediaItemSkipTypeRecap");
  if (v2 != 2)
    v3 = 0;
  if (v2 == 1)
    return CFSTR("TVPMediaItemSkipTypeIntro");
  else
    return (id)v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)start
{
  return self->_start;
}

- (double)duration
{
  return self->_duration;
}

- (double)target
{
  return self->_target;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)skipIntroReportingType
{
  return self->_skipIntroReportingType;
}

- (TVPMediaItemPromoInfo)promoInfo
{
  return self->_promoInfo;
}

- (void)setPromoInfo:(id)a3
{
  objc_storeStrong((id *)&self->_promoInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promoInfo, 0);
  objc_storeStrong((id *)&self->_skipIntroReportingType, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
