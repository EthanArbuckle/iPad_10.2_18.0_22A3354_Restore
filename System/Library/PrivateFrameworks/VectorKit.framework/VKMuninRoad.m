@implementation VKMuninRoad

- (VKMuninRoad)initWithMuninRoadEdge:(const void *)a3 localize:(BOOL)a4
{
  _QWORD *v5;
  VKMuninRoad *v6;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;

  md::MuninRoadEdge::localizedName((md::MuninRoadEdge *)v8, (uint64_t **)a3, a4);
  if (v9 >= 0)
    v5 = v8;
  else
    v5 = (_QWORD *)v8[0];
  v6 = -[VKMuninRoad initWithLocalizedName:](self, "initWithLocalizedName:", v5);
  if (SHIBYTE(v9) < 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v10 + 40))(v10, v8[0], v9 & 0x7FFFFFFFFFFFFFFFLL);
  return v6;
}

- (VKMuninRoad)initWithLocalizedName:(const char *)a3
{
  VKMuninRoad *v4;
  uint64_t v5;
  NSString *roadName;
  VKMuninRoad *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKMuninRoad;
  v4 = -[VKMuninRoad init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
    roadName = v4->_roadName;
    v4->_roadName = (NSString *)v5;

    v7 = v4;
  }

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), self->_roadName);
}

- (BOOL)isEqual:(id)a3
{
  VKMuninRoad *v4;
  uint64_t v5;
  char v6;
  void *v7;

  v4 = (VKMuninRoad *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[VKMuninRoad roadName](v4, "roadName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToString:", self->_roadName);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadName, 0);
}

@end
