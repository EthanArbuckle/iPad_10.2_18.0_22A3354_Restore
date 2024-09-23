@implementation _UIDebugReportComponents

- (_UIDebugReportComponents)init
{
  _UIDebugReportComponents *v2;
  _UIDebugReportComponents *v3;
  NSString *header;
  NSString *body;
  NSString *footer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDebugReportComponents;
  v2 = -[_UIDebugReportComponents init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    header = v2->_header;
    v2->_header = (NSString *)&stru_1E16EDF20;

    body = v3->_body;
    v3->_body = (NSString *)&stru_1E16EDF20;

    footer = v3->_footer;
    v3->_footer = (NSString *)&stru_1E16EDF20;

  }
  return v3;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
