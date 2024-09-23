@implementation TUIToggleBox

+ (void)setupSize
{
  if (qword_2CB398 != -1)
    dispatch_once(&qword_2CB398, &stru_23ECE8);
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIToggleBoxLayout, a2);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
