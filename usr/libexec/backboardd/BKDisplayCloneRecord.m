@implementation BKDisplayCloneRecord

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  unsigned __int8 v13;

  v4 = a3;
  v6 = objc_opt_class(BKDisplayCloneRecord, v5);
  v7 = v4;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (v10
    && (v11 = -[CAWindowServerDisplay displayId](self->_sourceDisplay, "displayId"),
        v11 == objc_msgSend(*((id *)v10 + 2), "displayId"))
    && (v12 = -[CAWindowServerDisplay displayId](self->_destinationDisplay, "displayId"),
        v12 == objc_msgSend(*((id *)v10 + 3), "displayId"))
    && self->_clientPID == *((_DWORD *)v10 + 2))
  {
    v13 = -[NSDictionary isEqual:](self->_options, "isEqual:", *((_QWORD *)v10 + 4));
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return (unint64_t)-[CAWindowServerDisplay hash](self->_destinationDisplay, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destinationDisplay, 0);
  objc_storeStrong((id *)&self->_sourceDisplay, 0);
}

@end
