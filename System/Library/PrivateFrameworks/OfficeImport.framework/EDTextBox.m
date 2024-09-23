@implementation EDTextBox

+ (id)textBox
{
  return objc_alloc_init(EDTextBox);
}

- (void)setAlignmentInfo:(id)a3
{
  EDAlignmentInfo *v5;
  EDAlignmentInfo **p_mAlignmentInfo;
  EDAlignmentInfo *mAlignmentInfo;
  EDAlignmentInfo *v8;

  v5 = (EDAlignmentInfo *)a3;
  mAlignmentInfo = self->mAlignmentInfo;
  p_mAlignmentInfo = &self->mAlignmentInfo;
  if (mAlignmentInfo != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mAlignmentInfo, a3);
    v5 = v8;
  }

}

- (void)setProtection:(id)a3
{
  EDProtection *v5;
  EDProtection **p_mProtection;
  EDProtection *mProtection;
  EDProtection *v8;

  v5 = (EDProtection *)a3;
  mProtection = self->mProtection;
  p_mProtection = &self->mProtection;
  if (mProtection != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mProtection, a3);
    v5 = v8;
  }

}

- (void)setText:(id)a3
{
  EDString *v5;
  EDString **p_mText;
  EDString *mText;
  EDString *v8;

  v5 = (EDString *)a3;
  mText = self->mText;
  p_mText = &self->mText;
  if (mText != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mText, a3);
    v5 = v8;
  }

}

- (id)text
{
  return self->mText;
}

- (id)alignmentInfo
{
  return self->mAlignmentInfo;
}

- (id)protection
{
  return self->mProtection;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTextBox;
  -[EDTextBox description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProtection, 0);
  objc_storeStrong((id *)&self->mAlignmentInfo, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end
