@implementation TUSimulatedParticipantUpdate

- (TUSimulatedParticipantUpdate)init
{
  TUSimulatedParticipantUpdate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUSimulatedParticipantUpdate;
  result = -[TUSimulatedParticipantUpdate init](&v3, sel_init);
  if (result)
    *(_BYTE *)&result->_hasSet = 0;
  return result;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_hasSet |= 1u;
  self->_spatialPersonaEnabled = a3;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[TUSimulatedParticipantUpdate hasSet](self, "hasSet") & 1) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" spatialPersonaEnabled=%d"), -[TUSimulatedParticipantUpdate isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUSimulatedParticipantUpdate)initWithCoder:(id)a3
{
  id v4;
  TUSimulatedParticipantUpdate *v5;
  id v6;
  void *v7;
  TUSimulatedParticipantUpdateHasSet *v8;
  void *v9;
  TUSimulatedParticipantUpdate *v10;
  uint64_t v12;

  v4 = a3;
  v5 = -[TUSimulatedParticipantUpdate init](self, "init");
  if (v5)
  {
    v12 = 0;
    v6 = objc_retainAutorelease(v4);
    NSStringFromSelector(sel_hasSet);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (TUSimulatedParticipantUpdateHasSet *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", v7, &v12);

    if (v12 != 4)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v5->_hasSet = *v8;
    if ((-[TUSimulatedParticipantUpdate hasSet](v5, "hasSet") & 1) != 0)
    {
      NSStringFromSelector(sel_isSpatialPersonaEnabled);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_spatialPersonaEnabled = objc_msgSend(v6, "decodeBoolForKey:", v9);

    }
  }
  v10 = v5;
LABEL_7:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  v7 = a3;
  NSStringFromSelector(sel_hasSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeBytes:length:forKey:", &self->_hasSet, 4, v4);

  if ((-[TUSimulatedParticipantUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    v5 = -[TUSimulatedParticipantUpdate isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled");
    NSStringFromSelector(sel_isSpatialPersonaEnabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeBool:forKey:", v5, v6);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUSimulatedParticipantUpdate *v4;

  v4 = -[TUSimulatedParticipantUpdate init](+[TUSimulatedParticipantUpdate allocWithZone:](TUSimulatedParticipantUpdate, "allocWithZone:", a3), "init");
  if ((-[TUSimulatedParticipantUpdate hasSet](self, "hasSet") & 1) != 0)
    -[TUSimulatedParticipantUpdate setSpatialPersonaEnabled:](v4, "setSpatialPersonaEnabled:", -[TUSimulatedParticipantUpdate isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  return v4;
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (TUSimulatedParticipantUpdateHasSet)hasSet
{
  return self->_hasSet;
}

@end
