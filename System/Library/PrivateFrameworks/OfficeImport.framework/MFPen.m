@implementation MFPen

- (MFPen)initWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6
{
  id v10;
  MFPen *v11;
  MFPen *v12;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MFPen;
  v11 = -[MFPen init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->m_penStyle = a3;
    v11->m_penWidth = a4;
    objc_storeStrong((id *)&v11->m_colour, a5);
    v12->m_userStyleArray = 0;
  }

  return v12;
}

- (int)selectInto:(id)a3
{
  objc_msgSend(a3, "setPen:", self);
  return 0;
}

- (id)getColor
{
  return self->m_colour;
}

- (int)getStyle
{
  return self->m_penStyle;
}

+ (id)pen
{
  return objc_alloc_init((Class)a1);
}

- (MFPen)init
{
  return -[MFPen initWithStyle:width:colour:styleArray:](self, "initWithStyle:width:colour:styleArray:", 5, 0, 0, 0);
}

+ (MFPen)penWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:width:colour:styleArray:", v8, v7, v10, a6);

  return (MFPen *)v11;
}

- (int)getWidth
{
  return self->m_penWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_colour, 0);
}

@end
