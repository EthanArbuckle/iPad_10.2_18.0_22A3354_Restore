@implementation TUConversationParticipantPresentationContext

- (TUConversationParticipantPresentationContext)initWithParticipantIdentifier:(unint64_t)a3 videoQuality:(unint64_t)a4 visibility:(id)a5 prominence:(id)a6 spatialPosition:(CGRect)a7 isInCanvas:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TUConversationParticipantPresentationContext *result;
  objc_super v18;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationParticipantPresentationContext;
  result = -[TUConversationParticipantPresentationContext init](&v18, sel_init);
  if (result)
  {
    result->_participantIdentifier = a3;
    result->_videoQuality = a4;
    result->_visibility = (NSNumber *)a5;
    result->_prominence = (NSNumber *)a6;
    result->_spatialPosition.origin.x = x;
    result->_spatialPosition.origin.y = y;
    result->_spatialPosition.size.width = width;
    result->_spatialPosition.size.height = height;
    result->_isInCanvas = a8;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" participantIdentifer=%llu"), -[TUConversationParticipantPresentationContext participantIdentifier](self, "participantIdentifier"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" videoQuality=%lu"), -[TUConversationParticipantPresentationContext videoQuality](self, "videoQuality"));
  -[TUConversationParticipantPresentationContext visibility](self, "visibility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" visibility=%lu"), objc_msgSend(v4, "integerValue"));

  -[TUConversationParticipantPresentationContext prominence](self, "prominence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" prominence=%lu"), objc_msgSend(v5, "integerValue"));

  -[TUConversationParticipantPresentationContext spatialPosition](self, "spatialPosition");
  v7 = v6;
  -[TUConversationParticipantPresentationContext spatialPosition](self, "spatialPosition");
  v9 = v8;
  -[TUConversationParticipantPresentationContext spatialPosition](self, "spatialPosition");
  v11 = v10;
  -[TUConversationParticipantPresentationContext spatialPosition](self, "spatialPosition");
  objc_msgSend(v3, "appendFormat:", CFSTR(" spatialPosition=(%f, %f, %f, %f)"), v7, v9, v11, v12);
  objc_msgSend(v3, "appendFormat:", CFSTR(" isInCanvas=%d"), -[TUConversationParticipantPresentationContext isInCanvas](self, "isInCanvas"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationParticipantPresentationContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  TUConversationParticipantPresentationContext *v24;

  v4 = a3;
  NSStringFromSelector(sel_participantIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", v5);

  NSStringFromSelector(sel_videoQuality);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", v7);

  NSStringFromSelector(sel_visibility);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_prominence);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_spatialPosition);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeRectForKey:", v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  NSStringFromSelector(sel_isInCanvas);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v4, "decodeBoolForKey:", v22);

  v24 = -[TUConversationParticipantPresentationContext initWithParticipantIdentifier:videoQuality:visibility:prominence:spatialPosition:isInCanvas:](self, "initWithParticipantIdentifier:videoQuality:visibility:prominence:spatialPosition:isInCanvas:", v6, v8, v10, v12, v23, v15, v17, v19, v21);
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  _BOOL8 v22;
  id v23;

  v4 = a3;
  v5 = -[TUConversationParticipantPresentationContext participantIdentifier](self, "participantIdentifier");
  NSStringFromSelector(sel_participantIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v5, v6);

  v7 = -[TUConversationParticipantPresentationContext videoQuality](self, "videoQuality");
  NSStringFromSelector(sel_videoQuality);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  -[TUConversationParticipantPresentationContext visibility](self, "visibility");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_visibility);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUConversationParticipantPresentationContext prominence](self, "prominence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_prominence);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUConversationParticipantPresentationContext spatialPosition](self, "spatialPosition");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  NSStringFromSelector(sel_spatialPosition);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeRect:forKey:", v21, v14, v16, v18, v20);

  v22 = -[TUConversationParticipantPresentationContext isInCanvas](self, "isInCanvas");
  NSStringFromSelector(sel_isInCanvas);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v22, v23);

}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (unint64_t)videoQuality
{
  return self->_videoQuality;
}

- (NSNumber)visibility
{
  return self->_visibility;
}

- (NSNumber)prominence
{
  return self->_prominence;
}

- (CGRect)spatialPosition
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_spatialPosition.origin.x;
  y = self->_spatialPosition.origin.y;
  width = self->_spatialPosition.size.width;
  height = self->_spatialPosition.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isInCanvas
{
  return self->_isInCanvas;
}

@end
