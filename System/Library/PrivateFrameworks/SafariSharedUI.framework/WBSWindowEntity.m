@implementation WBSWindowEntity

- (WBSWindowEntity)initWithIdentifier:(id)a3 title:(id)a4 isPrivate:(BOOL)a5
{
  id v8;
  id v9;
  WBSWindowEntity *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *title;
  WBSWindowEntity *v15;

  v8 = a3;
  v9 = a4;
  v10 = -[WBSWindowEntity init](self, "init");
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v13;

    v10->_isPrivate = a5;
    v15 = v10;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
