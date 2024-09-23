@implementation SAOnBehalfOfSingle

- (BOOL)isEqual:(id)a3
{
  SAOnBehalfOfSingle *v4;
  SAOnBehalfOfSingle *v5;
  const char *v6;
  SAOnBehalfOfSingle *v7;
  int proximatePid;
  int v9;
  int originPid;
  int v11;
  id Property;
  const char *v13;
  id v14;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  id v19;
  id v20;
  char v21;

  v4 = (SAOnBehalfOfSingle *)a3;
  if (v4 == self)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v7 = v5;
      if (self)
      {
        proximatePid = self->_proximatePid;
        if (v5)
        {
LABEL_5:
          v9 = v5->_proximatePid;
          goto LABEL_6;
        }
      }
      else
      {
        proximatePid = 0;
        if (v5)
          goto LABEL_5;
      }
      v9 = 0;
LABEL_6:
      if (proximatePid != v9)
        goto LABEL_23;
      if (self)
      {
        originPid = self->_originPid;
        if (v5)
        {
LABEL_9:
          v11 = v5->_originPid;
          goto LABEL_10;
        }
      }
      else
      {
        originPid = 0;
        if (v5)
          goto LABEL_9;
      }
      v11 = 0;
LABEL_10:
      if (originPid == v11)
      {
        if (self)
          Property = objc_getProperty(self, v6, 16, 1);
        else
          Property = 0;
        v14 = Property;
        if (v7)
          v15 = objc_getProperty(v7, v13, 16, 1);
        else
          v15 = 0;
        if (objc_msgSend(v14, "isEqualToString:", v15))
        {
          if (self)
            v17 = objc_getProperty(self, v16, 24, 1);
          else
            v17 = 0;
          v19 = v17;
          if (v7)
            v20 = objc_getProperty(v7, v18, 24, 1);
          else
            v20 = 0;
          v21 = objc_msgSend(v19, "isEqualToString:", v20);

        }
        else
        {
          v21 = 0;
        }

        goto LABEL_26;
      }
LABEL_23:
      v21 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v21 = 0;
  }
LABEL_27:

  return v21;
}

- (unint64_t)hash
{
  if (self)
    return *(int *)(self + 8) | ((unint64_t)*(unsigned int *)(self + 12) << 32);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originName, 0);
  objc_storeStrong((id *)&self->_proximateName, 0);
}

@end
