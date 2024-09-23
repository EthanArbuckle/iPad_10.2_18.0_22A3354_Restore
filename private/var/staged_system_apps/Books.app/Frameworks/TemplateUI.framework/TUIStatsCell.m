@implementation TUIStatsCell

+ (id)nib
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("TUIStatsCell"), v3));

  return v4;
}

- (void)updateContent
{
  NSMutableString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableString *v8;

  v3 = objc_opt_new(NSMutableString);
  v8 = v3;
  if (self->_header)
  {
    -[NSMutableString appendString:](v3, "appendString:");
    v3 = v8;
  }
  TUIStatsAppendTiming(v3, self->_timingProvider, CFSTR("\n"));
  -[NSMutableString appendString:](v8, "appendString:", CFSTR("\n"));
  TUIStatsAppendEvents(v8, self->_eventProvider, CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString stringByTrimmingCharactersInSet:](v8, "stringByTrimmingCharactersInSet:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsCell label](self, "label"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsCell label](self, "label"));
  objc_msgSend(v7, "sizeToFit");

}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (TUIStatsTiming)timingProvider
{
  return self->_timingProvider;
}

- (void)setTimingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_timingProvider, a3);
}

- (TUIStatsEventReporting)eventProvider
{
  return self->_eventProvider;
}

- (void)setEventProvider:(id)a3
{
  objc_storeStrong((id *)&self->_eventProvider, a3);
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_eventProvider, 0);
  objc_storeStrong((id *)&self->_timingProvider, 0);
  objc_destroyWeak((id *)&self->_label);
}

@end
