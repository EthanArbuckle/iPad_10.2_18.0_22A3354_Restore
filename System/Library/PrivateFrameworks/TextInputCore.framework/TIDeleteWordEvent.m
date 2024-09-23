@implementation TIDeleteWordEvent

- (TIDeleteWordEvent)initWithTIKeyboardState:(id)a3
{
  TIDeleteWordEvent *v3;
  uint64_t v4;
  NSMutableArray *allKeyboardInputsM;
  uint64_t v6;
  NSMutableArray *allTouchesM;
  uint64_t v8;
  NSMutableArray *candidatesOfferedM;
  uint64_t v10;
  NSMutableArray *touchLayoutsM;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TIDeleteWordEvent;
  v3 = -[TIUserAction initWithTIKeyboardState:](&v13, sel_initWithTIKeyboardState_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    allKeyboardInputsM = v3->_allKeyboardInputsM;
    v3->_allKeyboardInputsM = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    allTouchesM = v3->_allTouchesM;
    v3->_allTouchesM = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    candidatesOfferedM = v3->_candidatesOfferedM;
    v3->_candidatesOfferedM = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    touchLayoutsM = v3->_touchLayoutsM;
    v3->_touchLayoutsM = (NSMutableArray *)v10;

    -[TIUserAction setActionType:](v3, "setActionType:", 1);
  }
  return v3;
}

- (TIDeleteWordEvent)initWithCoder:(id)a3
{
  id v4;
  TIDeleteWordEvent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *allKeyboardInputsM;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *allTouchesM;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *touchLayoutsM;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSMutableArray *candidatesOfferedM;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TIDeleteWordEvent;
  v5 = -[TIUserAction initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("allKeyboardInputsM"));
    v9 = objc_claimAutoreleasedReturnValue();
    allKeyboardInputsM = v5->_allKeyboardInputsM;
    v5->_allKeyboardInputsM = (NSMutableArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("allTouchesM"));
    v14 = objc_claimAutoreleasedReturnValue();
    allTouchesM = v5->_allTouchesM;
    v5->_allTouchesM = (NSMutableArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("touchLayoutsM"));
    v19 = objc_claimAutoreleasedReturnValue();
    touchLayoutsM = v5->_touchLayoutsM;
    v5->_touchLayoutsM = (NSMutableArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("candidatesOffered"));
    v24 = objc_claimAutoreleasedReturnValue();
    candidatesOfferedM = v5->_candidatesOfferedM;
    v5->_candidatesOfferedM = (NSMutableArray *)v24;

    -[TIUserAction setActionType:](v5, "setActionType:", 1);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIDeleteWordEvent;
  v4 = a3;
  -[TIUserAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_allKeyboardInputsM, CFSTR("allKeyboardInputsM"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_allTouchesM, CFSTR("allTouchesM"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_touchLayoutsM, CFSTR("touchLayoutsM"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidatesOfferedM, CFSTR("candidatesOfferedM"));

}

- (void)addKeyInput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIDeleteWordEvent allKeyboardInputsM](self, "allKeyboardInputsM");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addKeyInputs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIDeleteWordEvent allKeyboardInputsM](self, "allKeyboardInputsM");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (void)addCandidatesOffered:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIDeleteWordEvent candidatesOfferedM](self, "candidatesOfferedM");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (void)addTouches:(id)a3 withLayoutIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TIDeleteWordEvent allTouchesM](self, "allTouchesM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v7);

  -[TIDeleteWordEvent touchLayoutsM](self, "touchLayoutsM");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v6);

}

- (NSArray)allKeyboardInputs
{
  void *v2;
  void *v3;

  -[TIDeleteWordEvent allKeyboardInputsM](self, "allKeyboardInputsM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)allTouches
{
  void *v2;
  void *v3;

  -[TIDeleteWordEvent allTouchesM](self, "allTouchesM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)candidatesOffered
{
  void *v2;
  void *v3;

  -[TIDeleteWordEvent candidatesOfferedM](self, "candidatesOfferedM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)touchLayouts
{
  void *v2;
  void *v3;

  -[TIDeleteWordEvent touchLayoutsM](self, "touchLayoutsM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSMutableArray)allKeyboardInputsM
{
  return self->_allKeyboardInputsM;
}

- (void)setAllKeyboardInputsM:(id)a3
{
  objc_storeStrong((id *)&self->_allKeyboardInputsM, a3);
}

- (NSMutableArray)allTouchesM
{
  return self->_allTouchesM;
}

- (void)setAllTouchesM:(id)a3
{
  objc_storeStrong((id *)&self->_allTouchesM, a3);
}

- (NSMutableArray)candidatesOfferedM
{
  return self->_candidatesOfferedM;
}

- (void)setCandidatesOfferedM:(id)a3
{
  objc_storeStrong((id *)&self->_candidatesOfferedM, a3);
}

- (NSMutableArray)touchLayoutsM
{
  return self->_touchLayoutsM;
}

- (void)setTouchLayoutsM:(id)a3
{
  objc_storeStrong((id *)&self->_touchLayoutsM, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchLayoutsM, 0);
  objc_storeStrong((id *)&self->_candidatesOfferedM, 0);
  objc_storeStrong((id *)&self->_allTouchesM, 0);
  objc_storeStrong((id *)&self->_allKeyboardInputsM, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
