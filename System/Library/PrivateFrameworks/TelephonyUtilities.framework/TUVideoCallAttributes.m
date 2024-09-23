@implementation TUVideoCallAttributes

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteCameraOrientation=%ld"), -[TUVideoCallAttributes remoteCameraOrientation](self, "remoteCameraOrientation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" localVideoContextSlotIdentifier=%ld"), -[TUVideoCallAttributes localVideoContextSlotIdentifier](self, "localVideoContextSlotIdentifier"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteVideoContextSlotIdentifier=%ld"), -[TUVideoCallAttributes remoteVideoContextSlotIdentifier](self, "remoteVideoContextSlotIdentifier"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUVideoCallAttributes isEqualToVideoCallAttributes:](self, "isEqualToVideoCallAttributes:", v4);

  return v5;
}

- (BOOL)isEqualToVideoCallAttributes:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = -[TUVideoCallAttributes remoteCameraOrientation](self, "remoteCameraOrientation");
  if (v5 == objc_msgSend(v4, "remoteCameraOrientation")
    && (v6 = -[TUVideoCallAttributes localVideoContextSlotIdentifier](self, "localVideoContextSlotIdentifier"),
        v6 == objc_msgSend(v4, "localVideoContextSlotIdentifier")))
  {
    v7 = -[TUVideoCallAttributes remoteVideoContextSlotIdentifier](self, "remoteVideoContextSlotIdentifier");
    v8 = v7 == objc_msgSend(v4, "remoteVideoContextSlotIdentifier");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;

  v3 = -[TUVideoCallAttributes remoteCameraOrientation](self, "remoteCameraOrientation");
  v4 = -[TUVideoCallAttributes localVideoContextSlotIdentifier](self, "localVideoContextSlotIdentifier") ^ v3;
  return v4 ^ -[TUVideoCallAttributes remoteVideoContextSlotIdentifier](self, "remoteVideoContextSlotIdentifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUVideoCallAttributes)initWithCoder:(id)a3
{
  id v4;
  TUVideoCallAttributes *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[TUVideoCallAttributes init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_remoteCameraOrientation);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_remoteCameraOrientation = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    NSStringFromSelector(sel_localVideoContextSlotIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localVideoContextSlotIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", v7);

    NSStringFromSelector(sel_remoteVideoContextSlotIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_remoteVideoContextSlotIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t remoteCameraOrientation;
  id v5;
  void *v6;
  int64_t localVideoContextSlotIdentifier;
  void *v8;
  int64_t remoteVideoContextSlotIdentifier;
  id v10;

  remoteCameraOrientation = self->_remoteCameraOrientation;
  v5 = a3;
  NSStringFromSelector(sel_remoteCameraOrientation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", remoteCameraOrientation, v6);

  localVideoContextSlotIdentifier = self->_localVideoContextSlotIdentifier;
  NSStringFromSelector(sel_localVideoContextSlotIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", localVideoContextSlotIdentifier, v8);

  remoteVideoContextSlotIdentifier = self->_remoteVideoContextSlotIdentifier;
  NSStringFromSelector(sel_remoteVideoContextSlotIdentifier);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", remoteVideoContextSlotIdentifier, v10);

}

- (int64_t)remoteCameraOrientation
{
  return self->_remoteCameraOrientation;
}

- (void)setRemoteCameraOrientation:(int64_t)a3
{
  self->_remoteCameraOrientation = a3;
}

- (int64_t)localVideoContextSlotIdentifier
{
  return self->_localVideoContextSlotIdentifier;
}

- (void)setLocalVideoContextSlotIdentifier:(int64_t)a3
{
  self->_localVideoContextSlotIdentifier = a3;
}

- (int64_t)remoteVideoContextSlotIdentifier
{
  return self->_remoteVideoContextSlotIdentifier;
}

- (void)setRemoteVideoContextSlotIdentifier:(int64_t)a3
{
  self->_remoteVideoContextSlotIdentifier = a3;
}

@end
