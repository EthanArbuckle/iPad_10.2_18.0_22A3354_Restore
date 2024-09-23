@implementation SCMLTextSanitizerRequest

- (SCMLTextSanitizerRequest)init
{
  SCMLTextSanitizerRequest *v2;
  SCMLTextSanitizerRequest *v3;
  NSString *text;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCMLTextSanitizerRequest;
  v2 = -[SCMLTextSanitizerRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    text = v2->_text;
    v2->_text = (NSString *)&stru_2516E5A08;

    *(_WORD *)&v3->_keepGoing = 0;
  }
  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)keepGoing
{
  return self->_keepGoing;
}

- (void)setKeepGoing:(BOOL)a3
{
  self->_keepGoing = a3;
}

- (BOOL)isPersonalized
{
  return self->_isPersonalized;
}

- (void)setIsPersonalized:(BOOL)a3
{
  self->_isPersonalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
