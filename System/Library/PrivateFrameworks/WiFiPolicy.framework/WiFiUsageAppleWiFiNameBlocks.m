@implementation WiFiUsageAppleWiFiNameBlocks

- (WiFiUsageAppleWiFiNameBlocks)initWithAPName:(id)a3
{
  id v4;
  void *v5;
  WiFiUsageAppleWiFiNameBlocks *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WiFiUsageAppleWiFiNameBlocks *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "containsString:", CFSTR(".")) & 1) == 0
    && (v22.receiver = self,
        v22.super_class = (Class)WiFiUsageAppleWiFiNameBlocks,
        v6 = -[WiFiUsageAppleWiFiNameBlocks init](&v22, sel_init),
        (self = v6) != 0))
  {
    -[WiFiUsageAppleWiFiNameBlocks setBuilding:](v6, "setBuilding:", 0);
    -[WiFiUsageAppleWiFiNameBlocks setSection:](self, "setSection:", 0);
    -[WiFiUsageAppleWiFiNameBlocks setFloor:](self, "setFloor:", 0);
    -[WiFiUsageAppleWiFiNameBlocks setPod:](self, "setPod:", 0);
    -[WiFiUsageAppleWiFiNameBlocks setOther:](self, "setOther:", 0);
    v7 = 0;
    if (objc_msgSend(v5, "containsString:", CFSTR("-")))
    {
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageAppleWiFiNameBlocks setBuilding:](self, "setBuilding:", v8);

    }
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(v7, "objectAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      objc_msgSend(v7, "objectAtIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 < 2)
      {
        -[WiFiUsageAppleWiFiNameBlocks setFloor:](self, "setFloor:", v11);
      }
      else
      {
        objc_msgSend(v11, "substringWithRange:", 0, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiUsageAppleWiFiNameBlocks setSection:](self, "setSection:", v13);

        objc_msgSend(v7, "objectAtIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "substringWithRange:", 1, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiUsageAppleWiFiNameBlocks setFloor:](self, "setFloor:", v15);

        objc_msgSend(v7, "objectAtIndex:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "substringFromIndex:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiUsageAppleWiFiNameBlocks setPod:](self, "setPod:", v16);

      }
    }
    if ((unint64_t)objc_msgSend(v7, "count") >= 4)
    {
      objc_msgSend(v7, "objectAtIndex:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageAppleWiFiNameBlocks setSection:](self, "setSection:", v19);

      objc_msgSend(v7, "objectAtIndex:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageAppleWiFiNameBlocks setFloor:](self, "setFloor:", v20);

      -[WiFiUsageAppleWiFiNameBlocks setPod:](self, "setPod:", 0);
    }
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(v7, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageAppleWiFiNameBlocks setOther:](self, "setOther:", v21);

    }
    self = self;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)building
{
  return self->_building;
}

- (void)setBuilding:(id)a3
{
  objc_storeStrong((id *)&self->_building, a3);
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (NSString)floor
{
  return self->_floor;
}

- (void)setFloor:(id)a3
{
  objc_storeStrong((id *)&self->_floor, a3);
}

- (NSString)pod
{
  return self->_pod;
}

- (void)setPod:(id)a3
{
  objc_storeStrong((id *)&self->_pod, a3);
}

- (NSString)other
{
  return self->_other;
}

- (void)setOther:(id)a3
{
  objc_storeStrong((id *)&self->_other, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_other, 0);
  objc_storeStrong((id *)&self->_pod, 0);
  objc_storeStrong((id *)&self->_floor, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_building, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
