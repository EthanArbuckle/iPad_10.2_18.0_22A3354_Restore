@implementation SROSmartRepliesActionMetadata

- (SROSmartRepliesActionMetadata)initWithType:(unint64_t)a3 title:(id)a4 attribution:(id)a5 stringRepresentation:(id)a6 date:(id)a7 hasRichActionType:(BOOL)a8 url:(id)a9 locationLatitude:(double)a10 locationLongitude:(double)a11 imageName:(id)a12 attributionSource:(unint64_t)a13
{
  _BOOL8 v15;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  SROSmartRepliesActionMetadata *v27;
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *v28;
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *underlyingMetadata;
  SROSmartRepliesActionMetadata *v30;
  objc_super v32;

  v15 = a8;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a9;
  v26 = a12;
  v32.receiver = self;
  v32.super_class = (Class)SROSmartRepliesActionMetadata;
  v27 = -[SROSmartRepliesActionMetadata init](&v32, sel_init);
  if (v27)
  {
    v28 = -[SRSmartRepliesActionMetadata initWithType:title:attribution:stringRepresentation:date:hasRichActionType:url:locationLatitude:locationLongitude:imageName:attributionSource:]([_TtC12SmartReplies28SRSmartRepliesActionMetadata alloc], "initWithType:title:attribution:stringRepresentation:date:hasRichActionType:url:locationLatitude:locationLongitude:imageName:attributionSource:", a3, v21, v22, v23, v24, v15, a10, a11, v25, v26, a13);
    underlyingMetadata = v27->_underlyingMetadata;
    v27->_underlyingMetadata = v28;

    v30 = v27;
  }

  return v27;
}

- (unint64_t)type
{
  return -[SRSmartRepliesActionMetadata type](self->_underlyingMetadata, "type");
}

- (NSString)title
{
  return -[SRSmartRepliesActionMetadata title](self->_underlyingMetadata, "title");
}

- (NSString)attribution
{
  return -[SRSmartRepliesActionMetadata attribution](self->_underlyingMetadata, "attribution");
}

- (NSString)stringRepresentation
{
  return -[SRSmartRepliesActionMetadata stringRepresentation](self->_underlyingMetadata, "stringRepresentation");
}

- (NSDate)date
{
  return -[SRSmartRepliesActionMetadata date](self->_underlyingMetadata, "date");
}

- (BOOL)hasRichActionType
{
  return -[SRSmartRepliesActionMetadata hasRichActionType](self->_underlyingMetadata, "hasRichActionType");
}

- (NSURL)url
{
  return -[SRSmartRepliesActionMetadata url](self->_underlyingMetadata, "url");
}

- (double)locationLatitude
{
  double result;

  -[SRSmartRepliesActionMetadata locationLatitude](self->_underlyingMetadata, "locationLatitude");
  return result;
}

- (double)locationLongitude
{
  double result;

  -[SRSmartRepliesActionMetadata locationLongitude](self->_underlyingMetadata, "locationLongitude");
  return result;
}

- (NSString)imageName
{
  return -[SRSmartRepliesActionMetadata imageName](self->_underlyingMetadata, "imageName");
}

- (unint64_t)attributionSource
{
  return -[SRSmartRepliesActionMetadata attributionSource](self->_underlyingMetadata, "attributionSource");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMetadata, 0);
}

@end
