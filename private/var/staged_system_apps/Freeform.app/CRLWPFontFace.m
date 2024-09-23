@implementation CRLWPFontFace

+ (id)fontFaceWithPostScriptName:(id)a3 faceName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v8)), "initWithPostScriptName:faceName:", v7, v6);

  return v9;
}

- (CRLWPFontFace)initWithPostScriptName:(id)a3 faceName:(id)a4
{
  id v6;
  id v7;
  CRLWPFontFace *v8;
  CRLWPFontFace *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLWPFontFace;
  v8 = -[CRLWPFontFace init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[CRLWPFontFace setPostScriptName:](v8, "setPostScriptName:", v6);
    -[CRLWPFontFace setFaceName:](v9, "setFaceName:", v7);
  }

  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@*) %p %@ %@"), objc_opt_class(self, a2), self, self->_postScriptName, self->_faceName);
}

- (NSString)postScriptName
{
  return self->_postScriptName;
}

- (void)setPostScriptName:(id)a3
{
  objc_storeStrong((id *)&self->_postScriptName, a3);
}

- (NSString)faceName
{
  return self->_faceName;
}

- (void)setFaceName:(id)a3
{
  objc_storeStrong((id *)&self->_faceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceName, 0);
  objc_storeStrong((id *)&self->_postScriptName, 0);
}

@end
