@implementation ICMediaTimeLabel

- (ICMediaTimeLabel)initWithFrame:(CGRect)a3
{
  ICMediaTimeLabel *v3;
  ICMediaTimeLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMediaTimeLabel;
  v3 = -[ICMediaTimeLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICMediaTimeLabel commonInit](v3, "commonInit");
  return v4;
}

- (ICMediaTimeLabel)initWithCoder:(id)a3
{
  ICMediaTimeLabel *v3;
  ICMediaTimeLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMediaTimeLabel;
  v3 = -[ICMediaTimeLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICMediaTimeLabel commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  ICMediaTimeFormatter *v3;

  v3 = objc_alloc_init(ICMediaTimeFormatter);
  -[ICMediaTimeLabel setFormatter:](self, "setFormatter:", v3);

  -[ICMediaTimeLabel setTextAlignment:](self, "setTextAlignment:", 2);
}

- (void)setMediaTimeValue:(id)a3
{
  ICMediaTime *v4;
  ICMediaTime *mediaTimeValue;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[ICMediaTime isEqualToMediaTime:](self->_mediaTimeValue, "isEqualToMediaTime:"))
  {
    v4 = (ICMediaTime *)objc_msgSend(v8, "copy");
    mediaTimeValue = self->_mediaTimeValue;
    self->_mediaTimeValue = v4;

    -[ICMediaTimeLabel formatter](self, "formatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForObjectValue:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMediaTimeLabel setText:](self, "setText:", v7);

  }
}

- (ICMediaTime)mediaTimeValue
{
  return self->_mediaTimeValue;
}

- (ICMediaTimeFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_mediaTimeValue, 0);
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[ICMediaTimeLabel mediaTimeValue](self, "mediaTimeValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "durationDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
