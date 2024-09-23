@implementation SFResultGradingFeedback

- (SFResultGradingFeedback)initWithResult:(id)a3 grade:(unint64_t)a4
{
  return -[SFResultGradingFeedback initWithResult:grade:textFeedback:](self, "initWithResult:grade:textFeedback:", a3, a4, 0);
}

- (SFResultGradingFeedback)initWithResult:(id)a3 grade:(unint64_t)a4 textFeedback:(id)a5
{
  id v8;
  SFResultGradingFeedback *v9;
  SFResultGradingFeedback *v10;
  uint64_t v11;
  NSString *textFeedback;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SFResultGradingFeedback;
  v9 = -[SFResultFeedback initWithResult:](&v14, sel_initWithResult_, a3);
  v10 = v9;
  if (v9)
  {
    v9->_grade = a4;
    v11 = objc_msgSend(v8, "copy");
    textFeedback = v10->_textFeedback;
    v10->_textFeedback = (NSString *)v11;

  }
  return v10;
}

- (SFResultGradingFeedback)initWithCoder:(id)a3
{
  id v4;
  SFResultGradingFeedback *v5;
  uint64_t v6;
  NSString *textFeedback;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFResultGradingFeedback;
  v5 = -[SFResultFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_grade = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_grade"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_textFeedback"));
    v6 = objc_claimAutoreleasedReturnValue();
    textFeedback = v5->_textFeedback;
    v5->_textFeedback = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFResultGradingFeedback;
  v4 = a3;
  -[SFResultFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_grade, CFSTR("_grade"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_textFeedback, CFSTR("_textFeedback"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SFResultGradingFeedback *v4;
  void *v5;
  SFResultGradingFeedback *v6;

  v4 = +[SFResultGradingFeedback allocWithZone:](SFResultGradingFeedback, "allocWithZone:", a3);
  -[SFResultFeedback result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFResultGradingFeedback initWithResult:grade:textFeedback:](v4, "initWithResult:grade:textFeedback:", v5, self->_grade, self->_textFeedback);

  return v6;
}

- (unint64_t)grade
{
  return self->_grade;
}

- (NSString)textFeedback
{
  return self->_textFeedback;
}

- (void)setTextFeedback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFeedback, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
