@implementation MCTypeInput

- (MCTypeInput)initWithCharacters:(id)a3 nearbyKeys:(id)a4
{
  return -[MCTypeInput initWithCharacters:point:nearbyKeys:sourceKeyboardState:](self, "initWithCharacters:point:nearbyKeys:sourceKeyboardState:", a3, a4, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (MCTypeInput)initWithCharacters:(id)a3 point:(CGPoint)a4 nearbyKeys:(id)a5 sourceKeyboardState:(id)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  MCTypeInput *v13;
  __CFString *v14;
  void *v15;
  objc_super v17;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MCTypeInput;
  v13 = -[MCKeyboardInput initWithSourceKeyboardState:](&v17, sel_initWithSourceKeyboardState_, a6);
  if (v13)
  {
    if (v11)
      v14 = (__CFString *)objc_msgSend(v11, "copy");
    else
      v14 = &stru_1EA1081D0;
    objc_storeStrong((id *)&v13->_characters, v14);
    if (v11)

    v13->_point.x = x;
    v13->_point.y = y;
    if (v12)
      v15 = (void *)objc_msgSend(v12, "copy");
    else
      v15 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v13->_nearbyKeys, v15);
    if (v12)

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCTypeInput;
  v5 = -[MCKeyboardInput copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_characters, "copyWithZone:", a3);
    v7 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v6;

    *((_OWORD *)v5 + 3) = self->_point;
    objc_storeStrong((id *)v5 + 5, self->_nearbyKeys);
  }
  return v5;
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCTypeInput characters](self, "characters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCTypeInput point](self, "point");
  v7 = v6;
  -[MCTypeInput point](self, "point");
  v9 = v8;
  -[MCTypeInput nearbyKeys](self, "nearbyKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[MCKeyboardInput sourceKeyboardState](self, "sourceKeyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@, (%.2f, %.2f), %lu, %@"), v5, v7, v9, v11, v12);

  return v4;
}

- (BOOL)canComposeNew:(id)a3
{
  return 0;
}

- (NSString)characters
{
  return self->_characters;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSArray)nearbyKeys
{
  return self->_nearbyKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyKeys, 0);
  objc_storeStrong((id *)&self->_characters, 0);
}

@end
