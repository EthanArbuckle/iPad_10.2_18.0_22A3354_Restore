@implementation CACTextMarkerRange

+ (CACTextMarkerRange)markerRangeWithStartMarker:(id)a3 endMarker:(id)a4
{
  return +[CACTextMarkerRange markerRangeWithStartMarker:endMarker:forTextElement:](CACTextMarkerRange, "markerRangeWithStartMarker:endMarker:forTextElement:", a3, a4, 0);
}

+ (CACTextMarkerRange)markerRangeWithStartMarker:(id)a3 endMarker:(id)a4 forTextElement:(id)a5
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_allocWithZone((Class)CACTextMarkerRange), "initWithStartMarker:endMarker:", v7, v6);

  return (CACTextMarkerRange *)v8;
}

+ (CACTextMarkerRange)markerRangeWithNSRange:(_NSRange)a3
{
  void *v3;
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    length = a3.length;
    location = a3.location;
    +[CACTextMarker markerWithIndex:](CACTextMarker, "markerWithIndex:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACTextMarker markerWithIndex:](CACTextMarker, "markerWithIndex:", location + length);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_allocWithZone((Class)CACTextMarkerRange), "initWithStartMarker:endMarker:", v6, v7);

  }
  return (CACTextMarkerRange *)v3;
}

+ (CACTextMarkerRange)markerRangeWithArray:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 2)
  {
    v4 = objc_allocWithZone((Class)CACTextMarker);
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithData:", v5);

    v7 = objc_allocWithZone((Class)CACTextMarker);
    objc_msgSend(v3, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithData:", v8);

    v10 = (void *)objc_msgSend(objc_allocWithZone((Class)CACTextMarkerRange), "initWithStartMarker:endMarker:", v6, v9);
  }
  else
  {
    v10 = 0;
  }

  return (CACTextMarkerRange *)v10;
}

- (CACTextMarkerRange)initWithStartMarker:(id)a3 endMarker:(id)a4
{
  id v7;
  id v8;
  CACTextMarkerRange *v9;
  id *p_isa;
  CACTextMarkerRange *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CACTextMarkerRange;
  v9 = -[CACTextMarkerRange init](&v13, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (!v9)
    goto LABEL_5;
  v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_startMarker, a3);
    objc_storeStrong(p_isa + 2, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (CACTextMarker)startMarker
{
  return self->_startMarker;
}

- (CACTextMarker)endMarker
{
  return self->_endMarker;
}

- (_NSRange)nsRange
{
  unint64_t v3;
  int64_t v4;
  NSObject *v5;
  NSUInteger v6;
  _NSRange result;

  v3 = -[CACTextMarker index](self->_startMarker, "index");
  v4 = -[CACTextMarker index](self->_endMarker, "index") - v3;
  if (v4 < 0)
  {
    CACLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CACTextMarkerRange nsRange].cold.1(v5);

    v4 = 0;
  }
  v6 = v3;
  result.length = v4;
  result.location = v6;
  return result;
}

- (id)array
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CACTextMarker data](self->_startMarker, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CACTextMarker data](self->_endMarker, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDBCE30];
      -[CACTextMarker data](self->_startMarker, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACTextMarker data](self->_endMarker, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEmpty
{
  CACTextMarker *startMarker;

  startMarker = self->_startMarker;
  return !startMarker || !self->_endMarker || -[CACTextMarker isEqual:](startMarker, "isEqual:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CACTextMarkerRange initWithStartMarker:endMarker:](+[CACTextMarkerRange allocWithZone:](CACTextMarkerRange, "allocWithZone:", a3), "initWithStartMarker:endMarker:", self->_startMarker, self->_endMarker);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[CACTextMarker hash](self->_startMarker, "hash");
  return -[CACTextMarker hash](self->_endMarker, "hash") + v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CACTextMarker *startMarker;
  void *v6;
  CACTextMarker *endMarker;
  void *v8;
  BOOL v9;

  v4 = a3;
  startMarker = self->_startMarker;
  objc_msgSend(v4, "startMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CACTextMarker isEqual:](startMarker, "isEqual:", v6))
  {
    endMarker = self->_endMarker;
    objc_msgSend(v4, "endMarker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CACTextMarker isEqual:](endMarker, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsMarker:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (+[CACTextMarker marker:precedesOrEqualsMarker:](CACTextMarker, "marker:precedesOrEqualsMarker:", self->_startMarker, v4))
  {
    v5 = +[CACTextMarker marker:precedesOrEqualsMarker:](CACTextMarker, "marker:precedesOrEqualsMarker:", v4, self->_endMarker);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)containsRange:(id)a3
{
  id v4;
  CACTextMarker *startMarker;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  startMarker = self->_startMarker;
  objc_msgSend(v4, "startMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CACTextMarker marker:precedesOrEqualsMarker:](CACTextMarker, "marker:precedesOrEqualsMarker:", startMarker, v6))
  {
    objc_msgSend(v4, "endMarker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[CACTextMarker marker:precedesOrEqualsMarker:](CACTextMarker, "marker:precedesOrEqualsMarker:", v7, self->_endMarker);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CACTextMarker data](self->_startMarker, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (-[CACTextMarker data](self->_endMarker, "data"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[CACTextMarker data](self->_startMarker, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACTextMarker data](self->_endMarker, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("CAC Marker Range: start: %@, end: %@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CAC Marker Range: start: %ld, end: %ld, length: %ld"), -[CACTextMarker index](self->_startMarker, "index"), -[CACTextMarker index](self->_endMarker, "index"), -[CACTextMarker index](self->_endMarker, "index") - -[CACTextMarker index](self->_startMarker, "index"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endMarker, 0);
  objc_storeStrong((id *)&self->_startMarker, 0);
}

- (void)nsRange
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "CACTextMarkerRange with end before start!!!!!", v1, 2u);
}

@end
