@implementation REElementUpdateOperation

- (REElementUpdateOperation)initWithElement:(id)a3 path:(id)a4 newPath:(id)a5 updateType:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  REElementUpdateOperation *v14;
  REElementUpdateOperation *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)REElementUpdateOperation;
  v14 = -[REElementUpdateOperation init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_element, a3);
    objc_storeStrong((id *)&v15->_path, a4);
    objc_storeStrong((id *)&v15->_movedToPath, a5);
    v15->_type = a6;
  }

  return v15;
}

+ (id)reloadElement:(id)a3 atPath:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElement:path:newPath:updateType:", v6, v5, 0, 0);

  return v7;
}

+ (id)insertElement:(id)a3 atPath:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElement:path:newPath:updateType:", v6, v5, 0, 2);

  return v7;
}

+ (id)removeElement:(id)a3 atPath:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElement:path:newPath:updateType:", v6, v5, 0, 1);

  return v7;
}

+ (id)moveElement:(id)a3 fromPath:(id)a4 toPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElement:path:newPath:updateType:", v9, v8, v7, 3);

  return v10;
}

+ (id)refreshElement:(id)a3 atPath:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElement:path:newPath:updateType:", v6, v5, 0, 4);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[REElement hash](self->_element, "hash");
  v4 = -[RESectionPath hash](self->_path, "hash") ^ v3;
  return v4 ^ -[RESectionPath hash](self->_movedToPath, "hash") ^ self->_type;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[REElement isEqual:](self->_element, "isEqual:", v5[1])
      && -[RESectionPath isEqual:](self->_path, "isEqual:", v5[2])
      && -[RESectionPath isEqual:](self->_movedToPath, "isEqual:", v5[3])
      && self->_type == v5[4];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  switch(self->_type)
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x24BDD17C8];
      -[REElementUpdateOperation path](self, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      REStringForSectionPath(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR(" Reload: %@"), v5);
      goto LABEL_8;
    case 1uLL:
      v7 = (void *)MEMORY[0x24BDD17C8];
      -[REElementUpdateOperation path](self, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      REStringForSectionPath(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR(" Remove: %@"), v5);
      goto LABEL_8;
    case 2uLL:
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[REElementUpdateOperation path](self, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      REStringForSectionPath(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR(" Insert: %@"), v5);
      goto LABEL_8;
    case 3uLL:
      v9 = (void *)MEMORY[0x24BDD17C8];
      -[REElementUpdateOperation path](self, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      REStringForSectionPath(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[REElementUpdateOperation movedToPath](self, "movedToPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      REStringForSectionPath(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR(" Move: %@ → %@"), v5, v11);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 4uLL:
      v12 = (void *)MEMORY[0x24BDD17C8];
      -[REElementUpdateOperation path](self, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      REStringForSectionPath(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR(" Refresh: %@"), v5);
LABEL_8:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      break;
    default:
      v6 = &stru_24CF92178;
      break;
  }
  v16.receiver = self;
  v16.super_class = (Class)REElementUpdateOperation;
  -[REElementUpdateOperation description](&v16, sel_description);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (REElement)element
{
  return self->_element;
}

- (RESectionPath)path
{
  return self->_path;
}

- (RESectionPath)movedToPath
{
  return self->_movedToPath;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedToPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
