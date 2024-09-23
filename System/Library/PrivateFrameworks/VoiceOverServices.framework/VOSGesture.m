@implementation VOSGesture

- (id)_initWithRawValue:(id)a3
{
  id v5;
  VOSGesture *v6;
  VOSGesture *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOSGesture;
  v6 = -[VOSGesture init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawValue, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_rawValue, CFSTR("rawValue"));
}

- (VOSGesture)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  VOSGesture *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[VOSGesture _initWithRawValue:](self, "_initWithRawValue:", v5);
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: %@"), v5, self, self->_rawValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VOSGesture rawValue](self, "rawValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (VOSGesture)OneFingerSingleTap
{
  if (OneFingerSingleTap_onceToken != -1)
    dispatch_once(&OneFingerSingleTap_onceToken, &__block_literal_global_1);
  return (VOSGesture *)(id)OneFingerSingleTap__Gesture;
}

void __32__VOSGesture_OneFingerSingleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerSingleTap"));
  v1 = (void *)OneFingerSingleTap__Gesture;
  OneFingerSingleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerDoubleTap
{
  if (OneFingerDoubleTap_onceToken != -1)
    dispatch_once(&OneFingerDoubleTap_onceToken, &__block_literal_global_183);
  return (VOSGesture *)(id)OneFingerDoubleTap__Gesture;
}

void __32__VOSGesture_OneFingerDoubleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerDoubleTap"));
  v1 = (void *)OneFingerDoubleTap__Gesture;
  OneFingerDoubleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerTripleTap
{
  if (OneFingerTripleTap_onceToken != -1)
    dispatch_once(&OneFingerTripleTap_onceToken, &__block_literal_global_186);
  return (VOSGesture *)(id)OneFingerTripleTap__Gesture;
}

void __32__VOSGesture_OneFingerTripleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerTripleTap"));
  v1 = (void *)OneFingerTripleTap__Gesture;
  OneFingerTripleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerQuadrupleTap
{
  if (OneFingerQuadrupleTap_onceToken != -1)
    dispatch_once(&OneFingerQuadrupleTap_onceToken, &__block_literal_global_189);
  return (VOSGesture *)(id)OneFingerQuadrupleTap__Gesture;
}

void __35__VOSGesture_OneFingerQuadrupleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerQuadrupleTap"));
  v1 = (void *)OneFingerQuadrupleTap__Gesture;
  OneFingerQuadrupleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerSingleTap
{
  if (TwoFingerSingleTap_onceToken != -1)
    dispatch_once(&TwoFingerSingleTap_onceToken, &__block_literal_global_192);
  return (VOSGesture *)(id)TwoFingerSingleTap__Gesture;
}

void __32__VOSGesture_TwoFingerSingleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerSingleTap"));
  v1 = (void *)TwoFingerSingleTap__Gesture;
  TwoFingerSingleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerDoubleTap
{
  if (TwoFingerDoubleTap_onceToken != -1)
    dispatch_once(&TwoFingerDoubleTap_onceToken, &__block_literal_global_195);
  return (VOSGesture *)(id)TwoFingerDoubleTap__Gesture;
}

void __32__VOSGesture_TwoFingerDoubleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerDoubleTap"));
  v1 = (void *)TwoFingerDoubleTap__Gesture;
  TwoFingerDoubleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerTripleTap
{
  if (TwoFingerTripleTap_onceToken != -1)
    dispatch_once(&TwoFingerTripleTap_onceToken, &__block_literal_global_198);
  return (VOSGesture *)(id)TwoFingerTripleTap__Gesture;
}

void __32__VOSGesture_TwoFingerTripleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerTripleTap"));
  v1 = (void *)TwoFingerTripleTap__Gesture;
  TwoFingerTripleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerQuadrupleTap
{
  if (TwoFingerQuadrupleTap_onceToken != -1)
    dispatch_once(&TwoFingerQuadrupleTap_onceToken, &__block_literal_global_201);
  return (VOSGesture *)(id)TwoFingerQuadrupleTap__Gesture;
}

void __35__VOSGesture_TwoFingerQuadrupleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerQuadrupleTap"));
  v1 = (void *)TwoFingerQuadrupleTap__Gesture;
  TwoFingerQuadrupleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoDistantFingerSingleTap
{
  if (TwoDistantFingerSingleTap_onceToken != -1)
    dispatch_once(&TwoDistantFingerSingleTap_onceToken, &__block_literal_global_204);
  return (VOSGesture *)(id)TwoDistantFingerSingleTap__Gesture;
}

void __39__VOSGesture_TwoDistantFingerSingleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoDistantFingerSingleTap"));
  v1 = (void *)TwoDistantFingerSingleTap__Gesture;
  TwoDistantFingerSingleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoDistantFingerDoubleTap
{
  if (TwoDistantFingerDoubleTap_onceToken != -1)
    dispatch_once(&TwoDistantFingerDoubleTap_onceToken, &__block_literal_global_207);
  return (VOSGesture *)(id)TwoDistantFingerDoubleTap__Gesture;
}

void __39__VOSGesture_TwoDistantFingerDoubleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoDistantFingerDoubleTap"));
  v1 = (void *)TwoDistantFingerDoubleTap__Gesture;
  TwoDistantFingerDoubleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoDistantFingerTripleTap
{
  if (TwoDistantFingerTripleTap_onceToken != -1)
    dispatch_once(&TwoDistantFingerTripleTap_onceToken, &__block_literal_global_210);
  return (VOSGesture *)(id)TwoDistantFingerTripleTap__Gesture;
}

void __39__VOSGesture_TwoDistantFingerTripleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoDistantFingerTripleTap"));
  v1 = (void *)TwoDistantFingerTripleTap__Gesture;
  TwoDistantFingerTripleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerSingleTap
{
  if (ThreeFingerSingleTap_onceToken != -1)
    dispatch_once(&ThreeFingerSingleTap_onceToken, &__block_literal_global_213);
  return (VOSGesture *)(id)ThreeFingerSingleTap__Gesture;
}

void __34__VOSGesture_ThreeFingerSingleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerSingleTap"));
  v1 = (void *)ThreeFingerSingleTap__Gesture;
  ThreeFingerSingleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerDoubleTap
{
  if (ThreeFingerDoubleTap_onceToken != -1)
    dispatch_once(&ThreeFingerDoubleTap_onceToken, &__block_literal_global_216);
  return (VOSGesture *)(id)ThreeFingerDoubleTap__Gesture;
}

void __34__VOSGesture_ThreeFingerDoubleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerDoubleTap"));
  v1 = (void *)ThreeFingerDoubleTap__Gesture;
  ThreeFingerDoubleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerTripleTap
{
  if (ThreeFingerTripleTap_onceToken != -1)
    dispatch_once(&ThreeFingerTripleTap_onceToken, &__block_literal_global_219);
  return (VOSGesture *)(id)ThreeFingerTripleTap__Gesture;
}

void __34__VOSGesture_ThreeFingerTripleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerTripleTap"));
  v1 = (void *)ThreeFingerTripleTap__Gesture;
  ThreeFingerTripleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerQuadrupleTap
{
  if (ThreeFingerQuadrupleTap_onceToken != -1)
    dispatch_once(&ThreeFingerQuadrupleTap_onceToken, &__block_literal_global_222);
  return (VOSGesture *)(id)ThreeFingerQuadrupleTap__Gesture;
}

void __37__VOSGesture_ThreeFingerQuadrupleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerQuadrupleTap"));
  v1 = (void *)ThreeFingerQuadrupleTap__Gesture;
  ThreeFingerQuadrupleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FourFingerSingleTap
{
  if (FourFingerSingleTap_onceToken != -1)
    dispatch_once(&FourFingerSingleTap_onceToken, &__block_literal_global_225);
  return (VOSGesture *)(id)FourFingerSingleTap__Gesture;
}

void __33__VOSGesture_FourFingerSingleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FourFingerSingleTap"));
  v1 = (void *)FourFingerSingleTap__Gesture;
  FourFingerSingleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FourFingerDoubleTap
{
  if (FourFingerDoubleTap_onceToken != -1)
    dispatch_once(&FourFingerDoubleTap_onceToken, &__block_literal_global_228);
  return (VOSGesture *)(id)FourFingerDoubleTap__Gesture;
}

void __33__VOSGesture_FourFingerDoubleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FourFingerDoubleTap"));
  v1 = (void *)FourFingerDoubleTap__Gesture;
  FourFingerDoubleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FourFingerTripleTap
{
  if (FourFingerTripleTap_onceToken != -1)
    dispatch_once(&FourFingerTripleTap_onceToken, &__block_literal_global_231);
  return (VOSGesture *)(id)FourFingerTripleTap__Gesture;
}

void __33__VOSGesture_FourFingerTripleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FourFingerTripleTap"));
  v1 = (void *)FourFingerTripleTap__Gesture;
  FourFingerTripleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FourFingerQuadrupleTap
{
  if (FourFingerQuadrupleTap_onceToken != -1)
    dispatch_once(&FourFingerQuadrupleTap_onceToken, &__block_literal_global_234);
  return (VOSGesture *)(id)FourFingerQuadrupleTap__Gesture;
}

void __36__VOSGesture_FourFingerQuadrupleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FourFingerQuadrupleTap"));
  v1 = (void *)FourFingerQuadrupleTap__Gesture;
  FourFingerQuadrupleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FiveFingerSingleTap
{
  if (FiveFingerSingleTap_onceToken != -1)
    dispatch_once(&FiveFingerSingleTap_onceToken, &__block_literal_global_237);
  return (VOSGesture *)(id)FiveFingerSingleTap__Gesture;
}

void __33__VOSGesture_FiveFingerSingleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FiveFingerSingleTap"));
  v1 = (void *)FiveFingerSingleTap__Gesture;
  FiveFingerSingleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FiveFingerDoubleTap
{
  if (FiveFingerDoubleTap_onceToken != -1)
    dispatch_once(&FiveFingerDoubleTap_onceToken, &__block_literal_global_240);
  return (VOSGesture *)(id)FiveFingerDoubleTap__Gesture;
}

void __33__VOSGesture_FiveFingerDoubleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FiveFingerDoubleTap"));
  v1 = (void *)FiveFingerDoubleTap__Gesture;
  FiveFingerDoubleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FiveFingerTripleTap
{
  if (FiveFingerTripleTap_onceToken != -1)
    dispatch_once(&FiveFingerTripleTap_onceToken, &__block_literal_global_243);
  return (VOSGesture *)(id)FiveFingerTripleTap__Gesture;
}

void __33__VOSGesture_FiveFingerTripleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FiveFingerTripleTap"));
  v1 = (void *)FiveFingerTripleTap__Gesture;
  FiveFingerTripleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FiveFingerQuadrupleTap
{
  if (FiveFingerQuadrupleTap_onceToken != -1)
    dispatch_once(&FiveFingerQuadrupleTap_onceToken, &__block_literal_global_246);
  return (VOSGesture *)(id)FiveFingerQuadrupleTap__Gesture;
}

void __36__VOSGesture_FiveFingerQuadrupleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FiveFingerQuadrupleTap"));
  v1 = (void *)FiveFingerQuadrupleTap__Gesture;
  FiveFingerQuadrupleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerFlickUp
{
  if (OneFingerFlickUp_onceToken != -1)
    dispatch_once(&OneFingerFlickUp_onceToken, &__block_literal_global_249);
  return (VOSGesture *)(id)OneFingerFlickUp__Gesture;
}

void __30__VOSGesture_OneFingerFlickUp__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerFlickUp"));
  v1 = (void *)OneFingerFlickUp__Gesture;
  OneFingerFlickUp__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerFlickDown
{
  if (OneFingerFlickDown_onceToken != -1)
    dispatch_once(&OneFingerFlickDown_onceToken, &__block_literal_global_252);
  return (VOSGesture *)(id)OneFingerFlickDown__Gesture;
}

void __32__VOSGesture_OneFingerFlickDown__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerFlickDown"));
  v1 = (void *)OneFingerFlickDown__Gesture;
  OneFingerFlickDown__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerFlickLeft
{
  if (OneFingerFlickLeft_onceToken != -1)
    dispatch_once(&OneFingerFlickLeft_onceToken, &__block_literal_global_255);
  return (VOSGesture *)(id)OneFingerFlickLeft__Gesture;
}

void __32__VOSGesture_OneFingerFlickLeft__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerFlickLeft"));
  v1 = (void *)OneFingerFlickLeft__Gesture;
  OneFingerFlickLeft__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerFlickRight
{
  if (OneFingerFlickRight_onceToken != -1)
    dispatch_once(&OneFingerFlickRight_onceToken, &__block_literal_global_258);
  return (VOSGesture *)(id)OneFingerFlickRight__Gesture;
}

void __33__VOSGesture_OneFingerFlickRight__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerFlickRight"));
  v1 = (void *)OneFingerFlickRight__Gesture;
  OneFingerFlickRight__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerFlickUp
{
  if (TwoFingerFlickUp_onceToken != -1)
    dispatch_once(&TwoFingerFlickUp_onceToken, &__block_literal_global_261);
  return (VOSGesture *)(id)TwoFingerFlickUp__Gesture;
}

void __30__VOSGesture_TwoFingerFlickUp__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerFlickUp"));
  v1 = (void *)TwoFingerFlickUp__Gesture;
  TwoFingerFlickUp__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerFlickDown
{
  if (TwoFingerFlickDown_onceToken != -1)
    dispatch_once(&TwoFingerFlickDown_onceToken, &__block_literal_global_264);
  return (VOSGesture *)(id)TwoFingerFlickDown__Gesture;
}

void __32__VOSGesture_TwoFingerFlickDown__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerFlickDown"));
  v1 = (void *)TwoFingerFlickDown__Gesture;
  TwoFingerFlickDown__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerFlickLeft
{
  if (TwoFingerFlickLeft_onceToken != -1)
    dispatch_once(&TwoFingerFlickLeft_onceToken, &__block_literal_global_267);
  return (VOSGesture *)(id)TwoFingerFlickLeft__Gesture;
}

void __32__VOSGesture_TwoFingerFlickLeft__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerFlickLeft"));
  v1 = (void *)TwoFingerFlickLeft__Gesture;
  TwoFingerFlickLeft__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerFlickRight
{
  if (TwoFingerFlickRight_onceToken != -1)
    dispatch_once(&TwoFingerFlickRight_onceToken, &__block_literal_global_270);
  return (VOSGesture *)(id)TwoFingerFlickRight__Gesture;
}

void __33__VOSGesture_TwoFingerFlickRight__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerFlickRight"));
  v1 = (void *)TwoFingerFlickRight__Gesture;
  TwoFingerFlickRight__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerFlickUp
{
  if (ThreeFingerFlickUp_onceToken != -1)
    dispatch_once(&ThreeFingerFlickUp_onceToken, &__block_literal_global_273);
  return (VOSGesture *)(id)ThreeFingerFlickUp__Gesture;
}

void __32__VOSGesture_ThreeFingerFlickUp__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerFlickUp"));
  v1 = (void *)ThreeFingerFlickUp__Gesture;
  ThreeFingerFlickUp__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerFlickDown
{
  if (ThreeFingerFlickDown_onceToken != -1)
    dispatch_once(&ThreeFingerFlickDown_onceToken, &__block_literal_global_276);
  return (VOSGesture *)(id)ThreeFingerFlickDown__Gesture;
}

void __34__VOSGesture_ThreeFingerFlickDown__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerFlickDown"));
  v1 = (void *)ThreeFingerFlickDown__Gesture;
  ThreeFingerFlickDown__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerFlickLeft
{
  if (ThreeFingerFlickLeft_onceToken != -1)
    dispatch_once(&ThreeFingerFlickLeft_onceToken, &__block_literal_global_279);
  return (VOSGesture *)(id)ThreeFingerFlickLeft__Gesture;
}

void __34__VOSGesture_ThreeFingerFlickLeft__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerFlickLeft"));
  v1 = (void *)ThreeFingerFlickLeft__Gesture;
  ThreeFingerFlickLeft__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerFlickRight
{
  if (ThreeFingerFlickRight_onceToken != -1)
    dispatch_once(&ThreeFingerFlickRight_onceToken, &__block_literal_global_282);
  return (VOSGesture *)(id)ThreeFingerFlickRight__Gesture;
}

void __35__VOSGesture_ThreeFingerFlickRight__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerFlickRight"));
  v1 = (void *)ThreeFingerFlickRight__Gesture;
  ThreeFingerFlickRight__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickUp
{
  if (ThreeFingerDoubleTapHoldAndFlickUp_onceToken != -1)
    dispatch_once(&ThreeFingerDoubleTapHoldAndFlickUp_onceToken, &__block_literal_global_285);
  return (VOSGesture *)(id)ThreeFingerDoubleTapHoldAndFlickUp__Gesture;
}

void __48__VOSGesture_ThreeFingerDoubleTapHoldAndFlickUp__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerDoubleTapHoldAndFlickUp"));
  v1 = (void *)ThreeFingerDoubleTapHoldAndFlickUp__Gesture;
  ThreeFingerDoubleTapHoldAndFlickUp__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickDown
{
  if (ThreeFingerDoubleTapHoldAndFlickDown_onceToken != -1)
    dispatch_once(&ThreeFingerDoubleTapHoldAndFlickDown_onceToken, &__block_literal_global_288);
  return (VOSGesture *)(id)ThreeFingerDoubleTapHoldAndFlickDown__Gesture;
}

void __50__VOSGesture_ThreeFingerDoubleTapHoldAndFlickDown__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerDoubleTapHoldAndFlickDown"));
  v1 = (void *)ThreeFingerDoubleTapHoldAndFlickDown__Gesture;
  ThreeFingerDoubleTapHoldAndFlickDown__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickLeft
{
  if (ThreeFingerDoubleTapHoldAndFlickLeft_onceToken != -1)
    dispatch_once(&ThreeFingerDoubleTapHoldAndFlickLeft_onceToken, &__block_literal_global_291);
  return (VOSGesture *)(id)ThreeFingerDoubleTapHoldAndFlickLeft__Gesture;
}

void __50__VOSGesture_ThreeFingerDoubleTapHoldAndFlickLeft__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerDoubleTapHoldAndFlickLeft"));
  v1 = (void *)ThreeFingerDoubleTapHoldAndFlickLeft__Gesture;
  ThreeFingerDoubleTapHoldAndFlickLeft__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerDoubleTapHoldAndFlickRight
{
  if (ThreeFingerDoubleTapHoldAndFlickRight_onceToken != -1)
    dispatch_once(&ThreeFingerDoubleTapHoldAndFlickRight_onceToken, &__block_literal_global_294);
  return (VOSGesture *)(id)ThreeFingerDoubleTapHoldAndFlickRight__Gesture;
}

void __51__VOSGesture_ThreeFingerDoubleTapHoldAndFlickRight__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerDoubleTapHoldAndFlickRight"));
  v1 = (void *)ThreeFingerDoubleTapHoldAndFlickRight__Gesture;
  ThreeFingerDoubleTapHoldAndFlickRight__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FourFingerFlickUp
{
  if (FourFingerFlickUp_onceToken != -1)
    dispatch_once(&FourFingerFlickUp_onceToken, &__block_literal_global_297);
  return (VOSGesture *)(id)FourFingerFlickUp__Gesture;
}

void __31__VOSGesture_FourFingerFlickUp__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FourFingerFlickUp"));
  v1 = (void *)FourFingerFlickUp__Gesture;
  FourFingerFlickUp__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FourFingerFlickDown
{
  if (FourFingerFlickDown_onceToken != -1)
    dispatch_once(&FourFingerFlickDown_onceToken, &__block_literal_global_300);
  return (VOSGesture *)(id)FourFingerFlickDown__Gesture;
}

void __33__VOSGesture_FourFingerFlickDown__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FourFingerFlickDown"));
  v1 = (void *)FourFingerFlickDown__Gesture;
  FourFingerFlickDown__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FourFingerFlickLeft
{
  if (FourFingerFlickLeft_onceToken != -1)
    dispatch_once(&FourFingerFlickLeft_onceToken, &__block_literal_global_303);
  return (VOSGesture *)(id)FourFingerFlickLeft__Gesture;
}

void __33__VOSGesture_FourFingerFlickLeft__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FourFingerFlickLeft"));
  v1 = (void *)FourFingerFlickLeft__Gesture;
  FourFingerFlickLeft__Gesture = (uint64_t)v0;

}

+ (VOSGesture)FourFingerFlickRight
{
  if (FourFingerFlickRight_onceToken != -1)
    dispatch_once(&FourFingerFlickRight_onceToken, &__block_literal_global_306);
  return (VOSGesture *)(id)FourFingerFlickRight__Gesture;
}

void __34__VOSGesture_FourFingerFlickRight__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("FourFingerFlickRight"));
  v1 = (void *)FourFingerFlickRight__Gesture;
  FourFingerFlickRight__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerSplitFlickUp
{
  if (OneFingerSplitFlickUp_onceToken != -1)
    dispatch_once(&OneFingerSplitFlickUp_onceToken, &__block_literal_global_309);
  return (VOSGesture *)(id)OneFingerSplitFlickUp__Gesture;
}

void __35__VOSGesture_OneFingerSplitFlickUp__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerSplitFlickUp"));
  v1 = (void *)OneFingerSplitFlickUp__Gesture;
  OneFingerSplitFlickUp__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerSplitFlickDown
{
  if (OneFingerSplitFlickDown_onceToken != -1)
    dispatch_once(&OneFingerSplitFlickDown_onceToken, &__block_literal_global_312);
  return (VOSGesture *)(id)OneFingerSplitFlickDown__Gesture;
}

void __37__VOSGesture_OneFingerSplitFlickDown__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerSplitFlickDown"));
  v1 = (void *)OneFingerSplitFlickDown__Gesture;
  OneFingerSplitFlickDown__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerSplitFlickLeft
{
  if (OneFingerSplitFlickLeft_onceToken != -1)
    dispatch_once(&OneFingerSplitFlickLeft_onceToken, &__block_literal_global_315);
  return (VOSGesture *)(id)OneFingerSplitFlickLeft__Gesture;
}

void __37__VOSGesture_OneFingerSplitFlickLeft__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerSplitFlickLeft"));
  v1 = (void *)OneFingerSplitFlickLeft__Gesture;
  OneFingerSplitFlickLeft__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerSplitFlickRight
{
  if (OneFingerSplitFlickRight_onceToken != -1)
    dispatch_once(&OneFingerSplitFlickRight_onceToken, &__block_literal_global_318);
  return (VOSGesture *)(id)OneFingerSplitFlickRight__Gesture;
}

void __38__VOSGesture_OneFingerSplitFlickRight__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerSplitFlickRight"));
  v1 = (void *)OneFingerSplitFlickRight__Gesture;
  OneFingerSplitFlickRight__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerSplitFlickLeft
{
  if (TwoFingerSplitFlickLeft_onceToken != -1)
    dispatch_once(&TwoFingerSplitFlickLeft_onceToken, &__block_literal_global_321);
  return (VOSGesture *)(id)TwoFingerSplitFlickLeft__Gesture;
}

void __37__VOSGesture_TwoFingerSplitFlickLeft__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerSplitFlickLeft"));
  v1 = (void *)TwoFingerSplitFlickLeft__Gesture;
  TwoFingerSplitFlickLeft__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerSplitFlickRight
{
  if (TwoFingerSplitFlickRight_onceToken != -1)
    dispatch_once(&TwoFingerSplitFlickRight_onceToken, &__block_literal_global_324);
  return (VOSGesture *)(id)TwoFingerSplitFlickRight__Gesture;
}

void __38__VOSGesture_TwoFingerSplitFlickRight__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerSplitFlickRight"));
  v1 = (void *)TwoFingerSplitFlickRight__Gesture;
  TwoFingerSplitFlickRight__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerRotateClockwise
{
  if (TwoFingerRotateClockwise_onceToken != -1)
    dispatch_once(&TwoFingerRotateClockwise_onceToken, &__block_literal_global_327);
  return (VOSGesture *)(id)TwoFingerRotateClockwise__Gesture;
}

void __38__VOSGesture_TwoFingerRotateClockwise__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerRotateClockwise"));
  v1 = (void *)TwoFingerRotateClockwise__Gesture;
  TwoFingerRotateClockwise__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerRotateCounterclockwise
{
  if (TwoFingerRotateCounterclockwise_onceToken != -1)
    dispatch_once(&TwoFingerRotateCounterclockwise_onceToken, &__block_literal_global_330);
  return (VOSGesture *)(id)TwoFingerRotateCounterclockwise__Gesture;
}

void __45__VOSGesture_TwoFingerRotateCounterclockwise__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerRotateCounterclockwise"));
  v1 = (void *)TwoFingerRotateCounterclockwise__Gesture;
  TwoFingerRotateCounterclockwise__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerPinch
{
  if (TwoFingerPinch_onceToken != -1)
    dispatch_once(&TwoFingerPinch_onceToken, &__block_literal_global_333);
  return (VOSGesture *)(id)TwoFingerPinch__Gesture;
}

void __28__VOSGesture_TwoFingerPinch__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerPinch"));
  v1 = (void *)TwoFingerPinch__Gesture;
  TwoFingerPinch__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerScrub
{
  if (TwoFingerScrub_onceToken != -1)
    dispatch_once(&TwoFingerScrub_onceToken, &__block_literal_global_336);
  return (VOSGesture *)(id)TwoFingerScrub__Gesture;
}

void __28__VOSGesture_TwoFingerScrub__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerScrub"));
  v1 = (void *)TwoFingerScrub__Gesture;
  TwoFingerScrub__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerSingleTapAndHold
{
  if (OneFingerSingleTapAndHold_onceToken != -1)
    dispatch_once(&OneFingerSingleTapAndHold_onceToken, &__block_literal_global_339);
  return (VOSGesture *)(id)OneFingerSingleTapAndHold__Gesture;
}

void __39__VOSGesture_OneFingerSingleTapAndHold__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerSingleTapAndHold"));
  v1 = (void *)OneFingerSingleTapAndHold__Gesture;
  OneFingerSingleTapAndHold__Gesture = (uint64_t)v0;

}

+ (VOSGesture)OneFingerDoubleTapAndHold
{
  if (OneFingerDoubleTapAndHold_onceToken != -1)
    dispatch_once(&OneFingerDoubleTapAndHold_onceToken, &__block_literal_global_342);
  return (VOSGesture *)(id)OneFingerDoubleTapAndHold__Gesture;
}

void __39__VOSGesture_OneFingerDoubleTapAndHold__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("OneFingerDoubleTapAndHold"));
  v1 = (void *)OneFingerDoubleTapAndHold__Gesture;
  OneFingerDoubleTapAndHold__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerSingleTapAndHold
{
  if (TwoFingerSingleTapAndHold_onceToken != -1)
    dispatch_once(&TwoFingerSingleTapAndHold_onceToken, &__block_literal_global_345);
  return (VOSGesture *)(id)TwoFingerSingleTapAndHold__Gesture;
}

void __39__VOSGesture_TwoFingerSingleTapAndHold__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerSingleTapAndHold"));
  v1 = (void *)TwoFingerSingleTapAndHold__Gesture;
  TwoFingerSingleTapAndHold__Gesture = (uint64_t)v0;

}

+ (VOSGesture)TwoFingerDoubleTapAndHold
{
  if (TwoFingerDoubleTapAndHold_onceToken != -1)
    dispatch_once(&TwoFingerDoubleTapAndHold_onceToken, &__block_literal_global_348);
  return (VOSGesture *)(id)TwoFingerDoubleTapAndHold__Gesture;
}

void __39__VOSGesture_TwoFingerDoubleTapAndHold__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("TwoFingerDoubleTapAndHold"));
  v1 = (void *)TwoFingerDoubleTapAndHold__Gesture;
  TwoFingerDoubleTapAndHold__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerSingleTapAndHold
{
  if (ThreeFingerSingleTapAndHold_onceToken != -1)
    dispatch_once(&ThreeFingerSingleTapAndHold_onceToken, &__block_literal_global_351);
  return (VOSGesture *)(id)ThreeFingerSingleTapAndHold__Gesture;
}

void __41__VOSGesture_ThreeFingerSingleTapAndHold__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerSingleTapAndHold"));
  v1 = (void *)ThreeFingerSingleTapAndHold__Gesture;
  ThreeFingerSingleTapAndHold__Gesture = (uint64_t)v0;

}

+ (VOSGesture)ThreeFingerDoubleTapAndHold
{
  if (ThreeFingerDoubleTapAndHold_onceToken != -1)
    dispatch_once(&ThreeFingerDoubleTapAndHold_onceToken, &__block_literal_global_354);
  return (VOSGesture *)(id)ThreeFingerDoubleTapAndHold__Gesture;
}

void __41__VOSGesture_ThreeFingerDoubleTapAndHold__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("ThreeFingerDoubleTapAndHold"));
  v1 = (void *)ThreeFingerDoubleTapAndHold__Gesture;
  ThreeFingerDoubleTapAndHold__Gesture = (uint64_t)v0;

}

+ (VOSGesture)BackTapDoubleTap
{
  if (BackTapDoubleTap_onceToken != -1)
    dispatch_once(&BackTapDoubleTap_onceToken, &__block_literal_global_357);
  return (VOSGesture *)(id)BackTapDoubleTap__Gesture;
}

void __30__VOSGesture_BackTapDoubleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("BackTapDoubleTap"));
  v1 = (void *)BackTapDoubleTap__Gesture;
  BackTapDoubleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)BackTapTripleTap
{
  if (BackTapTripleTap_onceToken != -1)
    dispatch_once(&BackTapTripleTap_onceToken, &__block_literal_global_360);
  return (VOSGesture *)(id)BackTapTripleTap__Gesture;
}

void __30__VOSGesture_BackTapTripleTap__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("BackTapTripleTap"));
  v1 = (void *)BackTapTripleTap__Gesture;
  BackTapTripleTap__Gesture = (uint64_t)v0;

}

+ (VOSGesture)Invalid
{
  if (Invalid_onceToken != -1)
    dispatch_once(&Invalid_onceToken, &__block_literal_global_363);
  return (VOSGesture *)(id)Invalid__Gesture;
}

void __21__VOSGesture_Invalid__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSGesture _initWithRawValue:]([VOSGesture alloc], "_initWithRawValue:", CFSTR("Invalid"));
  v1 = (void *)Invalid__Gesture;
  Invalid__Gesture = (uint64_t)v0;

}

+ (NSSet)allGestures
{
  if (allGestures_onceToken != -1)
    dispatch_once(&allGestures_onceToken, &__block_literal_global_366);
  return (NSSet *)(id)allGestures__AllGestures;
}

void __25__VOSGesture_allGestures__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;

  v14 = (void *)MEMORY[0x24BDBCF20];
  +[VOSGesture OneFingerSingleTap](VOSGesture, "OneFingerSingleTap");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerDoubleTap](VOSGesture, "OneFingerDoubleTap");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerTripleTap](VOSGesture, "OneFingerTripleTap");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerQuadrupleTap](VOSGesture, "OneFingerQuadrupleTap");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerSingleTap](VOSGesture, "TwoFingerSingleTap");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerDoubleTap](VOSGesture, "TwoFingerDoubleTap");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerTripleTap](VOSGesture, "TwoFingerTripleTap");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerQuadrupleTap](VOSGesture, "TwoFingerQuadrupleTap");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoDistantFingerSingleTap](VOSGesture, "TwoDistantFingerSingleTap");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoDistantFingerDoubleTap](VOSGesture, "TwoDistantFingerDoubleTap");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoDistantFingerTripleTap](VOSGesture, "TwoDistantFingerTripleTap");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerSingleTap](VOSGesture, "ThreeFingerSingleTap");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerDoubleTap](VOSGesture, "ThreeFingerDoubleTap");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerTripleTap](VOSGesture, "ThreeFingerTripleTap");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerQuadrupleTap](VOSGesture, "ThreeFingerQuadrupleTap");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FourFingerSingleTap](VOSGesture, "FourFingerSingleTap");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FourFingerDoubleTap](VOSGesture, "FourFingerDoubleTap");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FourFingerTripleTap](VOSGesture, "FourFingerTripleTap");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FourFingerQuadrupleTap](VOSGesture, "FourFingerQuadrupleTap");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FiveFingerSingleTap](VOSGesture, "FiveFingerSingleTap");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FiveFingerDoubleTap](VOSGesture, "FiveFingerDoubleTap");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FiveFingerTripleTap](VOSGesture, "FiveFingerTripleTap");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FiveFingerQuadrupleTap](VOSGesture, "FiveFingerQuadrupleTap");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerFlickUp](VOSGesture, "OneFingerFlickUp");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerFlickDown](VOSGesture, "OneFingerFlickDown");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerFlickLeft](VOSGesture, "OneFingerFlickLeft");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerFlickRight](VOSGesture, "OneFingerFlickRight");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerFlickUp](VOSGesture, "TwoFingerFlickUp");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerFlickDown](VOSGesture, "TwoFingerFlickDown");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerFlickLeft](VOSGesture, "TwoFingerFlickLeft");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerFlickRight](VOSGesture, "TwoFingerFlickRight");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerFlickUp](VOSGesture, "ThreeFingerFlickUp");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerFlickDown](VOSGesture, "ThreeFingerFlickDown");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerFlickLeft](VOSGesture, "ThreeFingerFlickLeft");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerFlickRight](VOSGesture, "ThreeFingerFlickRight");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickUp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickDown");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickLeft");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickRight");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FourFingerFlickUp](VOSGesture, "FourFingerFlickUp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FourFingerFlickDown](VOSGesture, "FourFingerFlickDown");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FourFingerFlickLeft](VOSGesture, "FourFingerFlickLeft");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture FourFingerFlickRight](VOSGesture, "FourFingerFlickRight");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerSplitFlickUp](VOSGesture, "OneFingerSplitFlickUp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerSplitFlickDown](VOSGesture, "OneFingerSplitFlickDown");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerSplitFlickLeft](VOSGesture, "OneFingerSplitFlickLeft");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerSplitFlickRight](VOSGesture, "OneFingerSplitFlickRight");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerSplitFlickLeft](VOSGesture, "TwoFingerSplitFlickLeft");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerSplitFlickRight](VOSGesture, "TwoFingerSplitFlickRight");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerRotateClockwise](VOSGesture, "TwoFingerRotateClockwise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerRotateCounterclockwise](VOSGesture, "TwoFingerRotateCounterclockwise");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerPinch](VOSGesture, "TwoFingerPinch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerScrub](VOSGesture, "TwoFingerScrub");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerSingleTapAndHold](VOSGesture, "OneFingerSingleTapAndHold");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture OneFingerDoubleTapAndHold](VOSGesture, "OneFingerDoubleTapAndHold");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerSingleTapAndHold](VOSGesture, "TwoFingerSingleTapAndHold");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerDoubleTapAndHold](VOSGesture, "TwoFingerDoubleTapAndHold");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerSingleTapAndHold](VOSGesture, "ThreeFingerSingleTapAndHold");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerDoubleTapAndHold](VOSGesture, "ThreeFingerDoubleTapAndHold");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture BackTapDoubleTap](VOSGesture, "BackTapDoubleTap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture BackTapTripleTap](VOSGesture, "BackTapTripleTap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithObjects:", v63, v62, v61, v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47,
    v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v39,
    v38,
    v37,
    v36,
    v35,
    v34,
    v33,
    v29,
    v31,
    v32,
    v30,
    v26,
    v28,
    v13,
    v27,
    v25,
    v12,
    v24,
    v23,
    v22,
    v21,
    v20,
    v19,
    v18,
    v17,
    v16,
    v15,
    v11,
    v0,
    v10,
    v1,
    v2,
    v3,
    v4,
    v5,
    v6,
    v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)allGestures__AllGestures;
  allGestures__AllGestures = v8;

}

+ (VOSGesture)gestureWithStringValue:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  uint64_t v7;
  id *i;
  id *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "allGestures", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (id *)((char *)i + 1))
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9[1], "isEqualToString:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (VOSGesture *)v6;
}

+ (id)horizontalMirrorGestureForGesture:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  +[VOSGesture OneFingerFlickLeft](VOSGesture, "OneFingerFlickLeft");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  +[VOSGesture OneFingerFlickRight](VOSGesture, "OneFingerFlickRight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != v3)
  {

    if (v6 == v3)
    {
      +[VOSGesture OneFingerFlickLeft](VOSGesture, "OneFingerFlickLeft");
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    +[VOSGesture TwoFingerFlickLeft](VOSGesture, "TwoFingerFlickLeft");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    +[VOSGesture TwoFingerFlickRight](VOSGesture, "TwoFingerFlickRight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v7 != v3)
    {

      if (v6 == v3)
      {
        +[VOSGesture TwoFingerFlickLeft](VOSGesture, "TwoFingerFlickLeft");
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      +[VOSGesture ThreeFingerFlickLeft](VOSGesture, "ThreeFingerFlickLeft");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      +[VOSGesture ThreeFingerFlickRight](VOSGesture, "ThreeFingerFlickRight");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      if (v9 != v3)
      {

        if (v6 == v3)
        {
          +[VOSGesture ThreeFingerFlickLeft](VOSGesture, "ThreeFingerFlickLeft");
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickLeft");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickRight");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v12;
        if (v11 != v3)
        {

          if (v6 == v3)
          {
            +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickLeft");
            v19 = objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          }
          +[VOSGesture FourFingerFlickLeft](VOSGesture, "FourFingerFlickLeft");
          v13 = (id)objc_claimAutoreleasedReturnValue();

          +[VOSGesture FourFingerFlickRight](VOSGesture, "FourFingerFlickRight");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v14;
          if (v13 != v3)
          {

            if (v6 == v3)
            {
              +[VOSGesture FourFingerFlickLeft](VOSGesture, "FourFingerFlickLeft");
              v19 = objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
            +[VOSGesture OneFingerSplitFlickLeft](VOSGesture, "OneFingerSplitFlickLeft");
            v15 = (id)objc_claimAutoreleasedReturnValue();

            +[VOSGesture OneFingerSplitFlickRight](VOSGesture, "OneFingerSplitFlickRight");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v16;
            if (v15 != v3)
            {

              if (v6 == v3)
              {
                +[VOSGesture OneFingerSplitFlickLeft](VOSGesture, "OneFingerSplitFlickLeft");
                v19 = objc_claimAutoreleasedReturnValue();
                goto LABEL_23;
              }
              +[VOSGesture TwoFingerSplitFlickLeft](VOSGesture, "TwoFingerSplitFlickLeft");
              v17 = (id)objc_claimAutoreleasedReturnValue();

              +[VOSGesture TwoFingerSplitFlickRight](VOSGesture, "TwoFingerSplitFlickRight");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v18;
              if (v17 != v3)
              {

                if (v6 != v3)
                {
                  v6 = 0;
                  goto LABEL_24;
                }
                +[VOSGesture TwoFingerSplitFlickLeft](VOSGesture, "TwoFingerSplitFlickLeft");
                v19 = objc_claimAutoreleasedReturnValue();
LABEL_23:
                v6 = (id)v19;
              }
            }
          }
        }
      }
    }
  }
LABEL_24:

  return v6;
}

+ (id)rtlGestureForGesture:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  +[VOSGesture OneFingerFlickLeft](VOSGesture, "OneFingerFlickLeft");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  +[VOSGesture OneFingerFlickRight](VOSGesture, "OneFingerFlickRight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != v3)
  {

    if (v6 == v3)
    {
      +[VOSGesture OneFingerFlickLeft](VOSGesture, "OneFingerFlickLeft");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    +[VOSGesture OneFingerSplitFlickLeft](VOSGesture, "OneFingerSplitFlickLeft");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    +[VOSGesture OneFingerSplitFlickRight](VOSGesture, "OneFingerSplitFlickRight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v7 != v3)
    {

      if (v6 == v3)
      {
        +[VOSGesture OneFingerSplitFlickLeft](VOSGesture, "OneFingerSplitFlickLeft");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      +[VOSGesture TwoFingerSplitFlickLeft](VOSGesture, "TwoFingerSplitFlickLeft");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      +[VOSGesture TwoFingerSplitFlickRight](VOSGesture, "TwoFingerSplitFlickRight");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      if (v9 != v3)
      {

        if (v6 != v3)
        {
          v6 = 0;
          goto LABEL_12;
        }
        +[VOSGesture TwoFingerSplitFlickLeft](VOSGesture, "TwoFingerSplitFlickLeft");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v6 = (id)v11;
      }
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *rawValue;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    rawValue = self->_rawValue;
    objc_msgSend(v4, "rawValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(rawValue) = -[NSString isEqualToString:](rawValue, "isEqualToString:", v6);

    if ((rawValue & 1) != 0)
      v7 = 1;
  }

  return v7;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VOSGesture.%@"), self->_rawValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VOSLocString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)_gesturesForFingerCount:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0:
      +[VOSGesture BackTapDoubleTap](VOSGesture, "BackTapDoubleTap");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

      +[VOSGesture BackTapTripleTap](VOSGesture, "BackTapTripleTap");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      +[VOSGesture OneFingerSingleTap](VOSGesture, "OneFingerSingleTap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      +[VOSGesture OneFingerDoubleTap](VOSGesture, "OneFingerDoubleTap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      +[VOSGesture OneFingerTripleTap](VOSGesture, "OneFingerTripleTap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

      +[VOSGesture OneFingerQuadrupleTap](VOSGesture, "OneFingerQuadrupleTap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

      +[VOSGesture OneFingerFlickUp](VOSGesture, "OneFingerFlickUp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

      +[VOSGesture OneFingerFlickDown](VOSGesture, "OneFingerFlickDown");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v12);

      +[VOSGesture OneFingerFlickLeft](VOSGesture, "OneFingerFlickLeft");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

      +[VOSGesture OneFingerFlickRight](VOSGesture, "OneFingerFlickRight");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

      +[VOSGesture OneFingerSingleTapAndHold](VOSGesture, "OneFingerSingleTapAndHold");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

      +[VOSGesture OneFingerDoubleTapAndHold](VOSGesture, "OneFingerDoubleTapAndHold");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      +[VOSGesture TwoFingerSingleTap](VOSGesture, "TwoFingerSingleTap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

      +[VOSGesture TwoFingerDoubleTap](VOSGesture, "TwoFingerDoubleTap");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v17);

      +[VOSGesture TwoFingerTripleTap](VOSGesture, "TwoFingerTripleTap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

      +[VOSGesture TwoFingerQuadrupleTap](VOSGesture, "TwoFingerQuadrupleTap");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v19);

      +[VOSGesture TwoDistantFingerSingleTap](VOSGesture, "TwoDistantFingerSingleTap");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v20);

      +[VOSGesture TwoDistantFingerDoubleTap](VOSGesture, "TwoDistantFingerDoubleTap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v21);

      +[VOSGesture TwoDistantFingerTripleTap](VOSGesture, "TwoDistantFingerTripleTap");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v22);

      +[VOSGesture TwoFingerFlickUp](VOSGesture, "TwoFingerFlickUp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v23);

      +[VOSGesture TwoFingerFlickDown](VOSGesture, "TwoFingerFlickDown");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v24);

      +[VOSGesture TwoFingerFlickLeft](VOSGesture, "TwoFingerFlickLeft");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v25);

      +[VOSGesture TwoFingerFlickRight](VOSGesture, "TwoFingerFlickRight");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);

      +[VOSGesture TwoFingerRotateClockwise](VOSGesture, "TwoFingerRotateClockwise");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v27);

      +[VOSGesture TwoFingerRotateCounterclockwise](VOSGesture, "TwoFingerRotateCounterclockwise");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v28);

      +[VOSGesture TwoFingerPinch](VOSGesture, "TwoFingerPinch");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v29);

      +[VOSGesture TwoFingerScrub](VOSGesture, "TwoFingerScrub");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v30);

      +[VOSGesture TwoFingerSingleTapAndHold](VOSGesture, "TwoFingerSingleTapAndHold");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v31);

      +[VOSGesture TwoFingerDoubleTapAndHold](VOSGesture, "TwoFingerDoubleTapAndHold");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      +[VOSGesture ThreeFingerSingleTap](VOSGesture, "ThreeFingerSingleTap");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v32);

      +[VOSGesture ThreeFingerDoubleTap](VOSGesture, "ThreeFingerDoubleTap");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v33);

      +[VOSGesture ThreeFingerTripleTap](VOSGesture, "ThreeFingerTripleTap");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v34);

      +[VOSGesture ThreeFingerQuadrupleTap](VOSGesture, "ThreeFingerQuadrupleTap");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v35);

      +[VOSGesture ThreeFingerFlickUp](VOSGesture, "ThreeFingerFlickUp");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v36);

      +[VOSGesture ThreeFingerFlickDown](VOSGesture, "ThreeFingerFlickDown");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v37);

      +[VOSGesture ThreeFingerFlickLeft](VOSGesture, "ThreeFingerFlickLeft");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v38);

      +[VOSGesture ThreeFingerFlickRight](VOSGesture, "ThreeFingerFlickRight");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v39);

      +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickUp");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v40);

      +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickDown");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v41);

      +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickLeft");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v42);

      +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickRight");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v43);

      +[VOSGesture ThreeFingerSingleTapAndHold](VOSGesture, "ThreeFingerSingleTapAndHold");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v44);

      +[VOSGesture ThreeFingerDoubleTapAndHold](VOSGesture, "ThreeFingerDoubleTapAndHold");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      +[VOSGesture FourFingerSingleTap](VOSGesture, "FourFingerSingleTap");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v45);

      +[VOSGesture FourFingerDoubleTap](VOSGesture, "FourFingerDoubleTap");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v46);

      +[VOSGesture FourFingerTripleTap](VOSGesture, "FourFingerTripleTap");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v47);

      +[VOSGesture FourFingerQuadrupleTap](VOSGesture, "FourFingerQuadrupleTap");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v48);

      +[VOSGesture FourFingerFlickUp](VOSGesture, "FourFingerFlickUp");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v49);

      +[VOSGesture FourFingerFlickDown](VOSGesture, "FourFingerFlickDown");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v50);

      +[VOSGesture FourFingerFlickLeft](VOSGesture, "FourFingerFlickLeft");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v51);

      +[VOSGesture FourFingerFlickRight](VOSGesture, "FourFingerFlickRight");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5:
      +[VOSGesture FiveFingerSingleTap](VOSGesture, "FiveFingerSingleTap");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v52);

      +[VOSGesture FiveFingerDoubleTap](VOSGesture, "FiveFingerDoubleTap");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v53);

      +[VOSGesture FiveFingerTripleTap](VOSGesture, "FiveFingerTripleTap");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v54);

      +[VOSGesture FiveFingerQuadrupleTap](VOSGesture, "FiveFingerQuadrupleTap");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 11:
      +[VOSGesture OneFingerSplitFlickUp](VOSGesture, "OneFingerSplitFlickUp");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v55);

      +[VOSGesture OneFingerSplitFlickDown](VOSGesture, "OneFingerSplitFlickDown");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v56);

      +[VOSGesture OneFingerSplitFlickLeft](VOSGesture, "OneFingerSplitFlickLeft");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v57);

      +[VOSGesture OneFingerSplitFlickRight](VOSGesture, "OneFingerSplitFlickRight");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 12:
      +[VOSGesture TwoFingerSplitFlickLeft](VOSGesture, "TwoFingerSplitFlickLeft");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v58);

      +[VOSGesture TwoFingerSplitFlickRight](VOSGesture, "TwoFingerSplitFlickRight");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v59 = (void *)v6;
      objc_msgSend(v4, "addObject:", v6);

      break;
    default:
      return v4;
  }
  return v4;
}

+ (id)_splitGesturesForFingerCount:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case -10:
      +[VOSGesture BackTapDoubleTap](VOSGesture, "BackTapDoubleTap");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

      +[VOSGesture BackTapTripleTap](VOSGesture, "BackTapTripleTap");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case -9:
      +[VOSGesture OneFingerSingleTap](VOSGesture, "OneFingerSingleTap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      +[VOSGesture OneFingerDoubleTap](VOSGesture, "OneFingerDoubleTap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      +[VOSGesture OneFingerTripleTap](VOSGesture, "OneFingerTripleTap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

      +[VOSGesture OneFingerQuadrupleTap](VOSGesture, "OneFingerQuadrupleTap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

      +[VOSGesture OneFingerFlickUp](VOSGesture, "OneFingerFlickUp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

      +[VOSGesture OneFingerFlickDown](VOSGesture, "OneFingerFlickDown");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v12);

      +[VOSGesture OneFingerFlickLeft](VOSGesture, "OneFingerFlickLeft");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

      +[VOSGesture OneFingerFlickRight](VOSGesture, "OneFingerFlickRight");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

      +[VOSGesture OneFingerSingleTapAndHold](VOSGesture, "OneFingerSingleTapAndHold");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

      +[VOSGesture OneFingerDoubleTapAndHold](VOSGesture, "OneFingerDoubleTapAndHold");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case -8:
      +[VOSGesture TwoFingerSingleTap](VOSGesture, "TwoFingerSingleTap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

      +[VOSGesture TwoFingerDoubleTap](VOSGesture, "TwoFingerDoubleTap");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v17);

      +[VOSGesture TwoFingerTripleTap](VOSGesture, "TwoFingerTripleTap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

      +[VOSGesture TwoFingerQuadrupleTap](VOSGesture, "TwoFingerQuadrupleTap");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v19);

      +[VOSGesture TwoDistantFingerSingleTap](VOSGesture, "TwoDistantFingerSingleTap");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v20);

      +[VOSGesture TwoDistantFingerDoubleTap](VOSGesture, "TwoDistantFingerDoubleTap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v21);

      +[VOSGesture TwoDistantFingerTripleTap](VOSGesture, "TwoDistantFingerTripleTap");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v22);

      +[VOSGesture TwoFingerFlickUp](VOSGesture, "TwoFingerFlickUp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v23);

      +[VOSGesture TwoFingerFlickDown](VOSGesture, "TwoFingerFlickDown");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v24);

      +[VOSGesture TwoFingerFlickLeft](VOSGesture, "TwoFingerFlickLeft");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v25);

      +[VOSGesture TwoFingerFlickRight](VOSGesture, "TwoFingerFlickRight");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);

      +[VOSGesture TwoFingerRotateClockwise](VOSGesture, "TwoFingerRotateClockwise");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v27);

      +[VOSGesture TwoFingerRotateCounterclockwise](VOSGesture, "TwoFingerRotateCounterclockwise");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v28);

      +[VOSGesture TwoFingerPinch](VOSGesture, "TwoFingerPinch");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v29);

      +[VOSGesture TwoFingerScrub](VOSGesture, "TwoFingerScrub");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v30);

      +[VOSGesture TwoFingerSingleTapAndHold](VOSGesture, "TwoFingerSingleTapAndHold");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v31);

      +[VOSGesture TwoFingerDoubleTapAndHold](VOSGesture, "TwoFingerDoubleTapAndHold");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case -7:
      +[VOSGesture ThreeFingerSingleTap](VOSGesture, "ThreeFingerSingleTap");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v32);

      +[VOSGesture ThreeFingerDoubleTap](VOSGesture, "ThreeFingerDoubleTap");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v33);

      +[VOSGesture ThreeFingerTripleTap](VOSGesture, "ThreeFingerTripleTap");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v34);

      +[VOSGesture ThreeFingerQuadrupleTap](VOSGesture, "ThreeFingerQuadrupleTap");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v35);

      +[VOSGesture ThreeFingerFlickUp](VOSGesture, "ThreeFingerFlickUp");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v36);

      +[VOSGesture ThreeFingerFlickDown](VOSGesture, "ThreeFingerFlickDown");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v37);

      +[VOSGesture ThreeFingerFlickLeft](VOSGesture, "ThreeFingerFlickLeft");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v38);

      +[VOSGesture ThreeFingerFlickRight](VOSGesture, "ThreeFingerFlickRight");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v39);

      +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickUp");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v40);

      +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickDown");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v41);

      +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickLeft");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v42);

      +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickRight");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v43);

      +[VOSGesture ThreeFingerSingleTapAndHold](VOSGesture, "ThreeFingerSingleTapAndHold");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v44);

      +[VOSGesture ThreeFingerDoubleTapAndHold](VOSGesture, "ThreeFingerDoubleTapAndHold");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case -6:
      +[VOSGesture FourFingerSingleTap](VOSGesture, "FourFingerSingleTap");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v45);

      +[VOSGesture FourFingerDoubleTap](VOSGesture, "FourFingerDoubleTap");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v46);

      +[VOSGesture FourFingerTripleTap](VOSGesture, "FourFingerTripleTap");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v47);

      +[VOSGesture FourFingerQuadrupleTap](VOSGesture, "FourFingerQuadrupleTap");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v48);

      +[VOSGesture FourFingerFlickUp](VOSGesture, "FourFingerFlickUp");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v49);

      +[VOSGesture FourFingerFlickDown](VOSGesture, "FourFingerFlickDown");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v50);

      +[VOSGesture FourFingerFlickLeft](VOSGesture, "FourFingerFlickLeft");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v51);

      +[VOSGesture FourFingerFlickRight](VOSGesture, "FourFingerFlickRight");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case -5:
      +[VOSGesture FiveFingerSingleTap](VOSGesture, "FiveFingerSingleTap");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v52);

      +[VOSGesture FiveFingerDoubleTap](VOSGesture, "FiveFingerDoubleTap");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v53);

      +[VOSGesture FiveFingerTripleTap](VOSGesture, "FiveFingerTripleTap");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v54);

      +[VOSGesture FiveFingerQuadrupleTap](VOSGesture, "FiveFingerQuadrupleTap");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      +[VOSGesture OneFingerSplitFlickUp](VOSGesture, "OneFingerSplitFlickUp");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v55);

      +[VOSGesture OneFingerSplitFlickDown](VOSGesture, "OneFingerSplitFlickDown");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v56);

      +[VOSGesture OneFingerSplitFlickLeft](VOSGesture, "OneFingerSplitFlickLeft");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v57);

      +[VOSGesture OneFingerSplitFlickRight](VOSGesture, "OneFingerSplitFlickRight");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      +[VOSGesture TwoFingerSplitFlickLeft](VOSGesture, "TwoFingerSplitFlickLeft");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v58);

      +[VOSGesture TwoFingerSplitFlickRight](VOSGesture, "TwoFingerSplitFlickRight");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v59 = (void *)v6;
      objc_msgSend(v4, "addObject:", v6);

      break;
    default:
      return v4;
  }
  return v4;
}

+ (NSSet)oneFingerGestures
{
  if (oneFingerGestures_onceToken != -1)
    dispatch_once(&oneFingerGestures_onceToken, &__block_literal_global_371);
  return (NSSet *)(id)oneFingerGestures__gestures;
}

void __31__VOSGesture_oneFingerGestures__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VOSGesture _gesturesForFingerCount:](VOSGesture, "_gesturesForFingerCount:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)oneFingerGestures__gestures;
  oneFingerGestures__gestures = v0;

}

+ (NSSet)twoFingerGestures
{
  if (twoFingerGestures_onceToken != -1)
    dispatch_once(&twoFingerGestures_onceToken, &__block_literal_global_372);
  return (NSSet *)(id)twoFingerGestures__gestures;
}

void __31__VOSGesture_twoFingerGestures__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VOSGesture _gesturesForFingerCount:](VOSGesture, "_gesturesForFingerCount:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)twoFingerGestures__gestures;
  twoFingerGestures__gestures = v0;

}

+ (NSSet)threeFingerGestures
{
  if (threeFingerGestures_onceToken != -1)
    dispatch_once(&threeFingerGestures_onceToken, &__block_literal_global_373);
  return (NSSet *)(id)threeFingerGestures__gestures;
}

void __33__VOSGesture_threeFingerGestures__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VOSGesture _gesturesForFingerCount:](VOSGesture, "_gesturesForFingerCount:", 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)threeFingerGestures__gestures;
  threeFingerGestures__gestures = v0;

}

+ (NSSet)fourFingerGestures
{
  if (fourFingerGestures_onceToken != -1)
    dispatch_once(&fourFingerGestures_onceToken, &__block_literal_global_374);
  return (NSSet *)(id)fourFingerGestures__gestures;
}

void __32__VOSGesture_fourFingerGestures__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VOSGesture _gesturesForFingerCount:](VOSGesture, "_gesturesForFingerCount:", 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fourFingerGestures__gestures;
  fourFingerGestures__gestures = v0;

}

+ (NSSet)fiveFingerGestures
{
  if (fiveFingerGestures_onceToken != -1)
    dispatch_once(&fiveFingerGestures_onceToken, &__block_literal_global_375);
  return (NSSet *)(id)fiveFingerGestures__gestures;
}

void __32__VOSGesture_fiveFingerGestures__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VOSGesture _gesturesForFingerCount:](VOSGesture, "_gesturesForFingerCount:", 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fiveFingerGestures__gestures;
  fiveFingerGestures__gestures = v0;

}

+ (NSSet)oneFingerSplitGestures
{
  if (oneFingerSplitGestures_onceToken != -1)
    dispatch_once(&oneFingerSplitGestures_onceToken, &__block_literal_global_376);
  return (NSSet *)(id)oneFingerSplitGestures__gestures;
}

void __36__VOSGesture_oneFingerSplitGestures__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VOSGesture _splitGesturesForFingerCount:](VOSGesture, "_splitGesturesForFingerCount:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)oneFingerSplitGestures__gestures;
  oneFingerSplitGestures__gestures = v0;

}

+ (NSSet)twoFingerSplitGestures
{
  if (twoFingerSplitGestures_onceToken != -1)
    dispatch_once(&twoFingerSplitGestures_onceToken, &__block_literal_global_377);
  return (NSSet *)(id)twoFingerSplitGestures__gestures;
}

void __36__VOSGesture_twoFingerSplitGestures__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VOSGesture _splitGesturesForFingerCount:](VOSGesture, "_splitGesturesForFingerCount:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)twoFingerSplitGestures__gestures;
  twoFingerSplitGestures__gestures = v0;

}

+ (NSSet)conflictingZoomGestures
{
  if (conflictingZoomGestures_onceToken != -1)
    dispatch_once(&conflictingZoomGestures_onceToken, &__block_literal_global_378);
  return (NSSet *)(id)conflictingZoomGestures__gestures;
}

void __37__VOSGesture_conflictingZoomGestures__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x24BDBCF20];
  +[VOSGesture ThreeFingerDoubleTap](VOSGesture, "ThreeFingerDoubleTap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerTripleTap](VOSGesture, "ThreeFingerTripleTap");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture ThreeFingerQuadrupleTap](VOSGesture, "ThreeFingerQuadrupleTap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v5, v1, v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)conflictingZoomGestures__gestures;
  conflictingZoomGestures__gestures = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawValue, 0);
}

@end
