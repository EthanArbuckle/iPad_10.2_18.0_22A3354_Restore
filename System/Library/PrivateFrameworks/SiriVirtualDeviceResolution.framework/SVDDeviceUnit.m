@implementation SVDDeviceUnit

- (SVDDeviceUnit)initWithIdentifier:(id)a3 assistantId:(id)a4 builder:(id)a5
{
  id v8;
  id v9;
  id v10;
  SVDDeviceUnit *v11;
  SVDDeviceUnitSwift *v12;
  uint64_t v13;
  SVDDeviceUnitSwift *backing;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SVDDeviceUnit;
  v11 = -[SVDDeviceUnit init](&v18, sel_init);
  if (v11)
  {
    v12 = [SVDDeviceUnitSwift alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__SVDDeviceUnit_initWithIdentifier_assistantId_builder___block_invoke;
    v16[3] = &unk_1E7CCA980;
    v17 = v10;
    v13 = -[SVDDeviceUnitSwift initWithIdentifier:assistantId:builder:](v12, "initWithIdentifier:assistantId:builder:", v8, v9, v16);
    backing = v11->_backing;
    v11->_backing = (SVDDeviceUnitSwift *)v13;

  }
  return v11;
}

- (SVDDeviceUnit)initWithIdentifier:(id)a3 assistantId:(id)a4 name:(id)a5 roomName:(id)a6 proximity:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SVDDeviceUnit *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  int64_t v21;

  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__SVDDeviceUnit_initWithIdentifier_assistantId_name_roomName_proximity___block_invoke;
  v18[3] = &unk_1E7CCA9A8;
  v19 = v12;
  v20 = v13;
  v21 = a7;
  v14 = v13;
  v15 = v12;
  v16 = -[SVDDeviceUnit initWithIdentifier:assistantId:builder:](self, "initWithIdentifier:assistantId:builder:", a3, a4, v18);

  return v16;
}

- (SVDDeviceUnit)initWithDeviceUnit:(id)a3
{
  id v5;
  SVDDeviceUnit *v6;
  SVDDeviceUnit *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDDeviceUnit;
  v6 = -[SVDDeviceUnit init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backing, a3);

  return v7;
}

- (NSString)identifier
{
  return -[SVDDeviceUnitSwift identifier](self->_backing, "identifier");
}

- (NSString)assistantId
{
  return -[SVDDeviceUnitSwift assistantId](self->_backing, "assistantId");
}

- (NSString)name
{
  return -[SVDDeviceUnitSwift name](self->_backing, "name");
}

- (NSString)roomName
{
  return -[SVDDeviceUnitSwift roomName](self->_backing, "roomName");
}

- (int64_t)proximity
{
  return -[SVDDeviceUnitSwift proximity](self->_backing, "proximity");
}

- (NSString)mediaRouteIdentifier
{
  return -[SVDDeviceUnitSwift mediaRouteIdentifier](self->_backing, "mediaRouteIdentifier");
}

- (BOOL)isCommunalDevice
{
  return -[SVDDeviceUnitSwift isCommunalDevice](self->_backing, "isCommunalDevice");
}

- (NSString)homeKitAccessoryIdentifier
{
  return -[SVDDeviceUnitSwift homeKitAccessoryIdentifier](self->_backing, "homeKitAccessoryIdentifier");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SVDDeviceUnit identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVDDeviceUnit assistantId](self, "assistantId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVDDeviceUnit name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVDDeviceUnit roomName](self, "roomName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SVDDeviceUnit proximity](self, "proximity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVDDeviceUnit mediaRouteIdentifier](self, "mediaRouteIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SVDDeviceUnit isCommunalDevice](self, "isCommunalDevice");
  -[SVDDeviceUnit homeKitAccessoryIdentifier](self, "homeKitAccessoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier:%@, assistantId:%@, name:%@, roomName:%@, proximity:%@, mediaRouteId:%@, isCommunalDevice:%d, homeKitId:%@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backing, CFSTR("backing"));
}

- (SVDDeviceUnit)initWithCoder:(id)a3
{
  id v4;
  SVDDeviceUnit *v5;
  uint64_t v6;
  SVDDeviceUnitSwift *backing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDDeviceUnit;
  v5 = -[SVDDeviceUnit init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backing"));
    v6 = objc_claimAutoreleasedReturnValue();
    backing = v5->_backing;
    v5->_backing = (SVDDeviceUnitSwift *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SVDDeviceUnit *v4;
  void *v5;
  void *v6;
  SVDDeviceUnit *v7;
  _QWORD v9[5];

  v4 = [SVDDeviceUnit alloc];
  -[SVDDeviceUnit identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVDDeviceUnit assistantId](self, "assistantId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__SVDDeviceUnit_copyWithZone___block_invoke;
  v9[3] = &unk_1E7CCA9D0;
  v9[4] = self;
  v7 = -[SVDDeviceUnit initWithIdentifier:assistantId:builder:](v4, "initWithIdentifier:assistantId:builder:", v5, v6, v9);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SVDDeviceUnit identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SVDDeviceUnit assistantId](self, "assistantId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = -[SVDDeviceUnit hash](self, "hash");
  LOBYTE(v6) = v6 == objc_msgSend(v5, "hash");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

void __30__SVDDeviceUnit_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(*(id *)(a1 + 32), "roomName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoomName:", v6);

  objc_msgSend(v4, "setProximity:", objc_msgSend(*(id *)(a1 + 32), "proximity"));
  objc_msgSend(*(id *)(a1 + 32), "mediaRouteIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaRouteIdentifier:", v7);

  objc_msgSend(v4, "setIsCommunalDevice:", objc_msgSend(*(id *)(a1 + 32), "isCommunalDevice"));
  objc_msgSend(*(id *)(a1 + 32), "homeKitAccessoryIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeKitAccessoryIdentifier:", v8);

}

void __72__SVDDeviceUnit_initWithIdentifier_assistantId_name_roomName_proximity___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setName:", v3);
  objc_msgSend(v4, "setRoomName:", a1[5]);
  objc_msgSend(v4, "setProximity:", a1[6]);

}

void __56__SVDDeviceUnit_initWithIdentifier_assistantId_builder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _SVDMutableDeviceUnit *v8;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = a2;
    v8 = objc_alloc_init(_SVDMutableDeviceUnit);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    -[_SVDMutableDeviceUnit name](v8, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", v4);

    -[_SVDMutableDeviceUnit roomName](v8, "roomName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRoomName:", v5);

    objc_msgSend(v3, "setProximity:", -[_SVDMutableDeviceUnit proximity](v8, "proximity"));
    -[_SVDMutableDeviceUnit mediaRouteIdentifier](v8, "mediaRouteIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMediaRouteIdentifier:", v6);

    objc_msgSend(v3, "setIsCommunalDevice:", -[_SVDMutableDeviceUnit isCommunalDevice](v8, "isCommunalDevice"));
    -[_SVDMutableDeviceUnit homeKitAccessoryIdentifier](v8, "homeKitAccessoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHomeKitAccessoryIdentifier:", v7);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
