@implementation TUIStyledTextFragment

- (TUIStyledTextFragment)initWithStyle:(unint64_t)a3 attributes:(id)a4 fragments:(id)a5
{
  id v8;
  TUIStyledTextFragment *v9;
  TUIStyledTextFragment *v10;
  NSArray *v11;
  NSArray *fragments;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TUIStyledTextFragment;
  v9 = -[TUIStyledTextFragment init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_attributes = ($92066C5B8ED375D06BBF3B95346A0A30)a4;
    v9->_style = a3;
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    fragments = v10->_fragments;
    v10->_fragments = v11;

  }
  return v10;
}

- (void)appendToBuilder:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  unint64_t style;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  style = self->_style;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5BF2C;
  v11[3] = &unk_23E2C8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v10, "appendWithStyle:color:fontSpec:block:", style, 0, 0, v11);

}

+ (id)supportedAttributes
{
  return 0;
}

- ($5B0274039C15E806FA91EF6B5728B838)attributes
{
  return ($5B0274039C15E806FA91EF6B5728B838)self->_attributes;
}

- (void)setAttributes:(id)a3
{
  self->_attributes = ($92066C5B8ED375D06BBF3B95346A0A30)a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSArray)fragments
{
  return self->_fragments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragments, 0);
}

@end
