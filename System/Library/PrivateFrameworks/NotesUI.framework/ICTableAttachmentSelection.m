@implementation ICTableAttachmentSelection

- (ICTableAttachmentSelection)init
{
  ICTableAttachmentSelection *v2;
  ICTableAttachmentSelection *v3;
  NSArray *columns;
  NSArray *v5;
  NSArray *rows;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICTableAttachmentSelection;
  v2 = -[ICTableAttachmentSelection init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    columns = v2->_columns;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_type = 0;
    v2->_columns = v5;

    rows = v3->_rows;
    v3->_rows = v5;

  }
  return v3;
}

- (BOOL)isRangeOrSpanningSelection
{
  return -[ICTableAttachmentSelection type](self, "type") > 1;
}

- (BOOL)valid
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  switch(-[ICTableAttachmentSelection type](self, "type"))
  {
    case 0uLL:
      return 1;
    case 1uLL:
      -[ICTableAttachmentSelection columns](self, "columns");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count") != 1)
        goto LABEL_12;
      -[ICTableAttachmentSelection rows](self, "rows");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "count") == 1;
      goto LABEL_11;
    case 2uLL:
      -[ICTableAttachmentSelection columns](self, "columns");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3uLL:
      -[ICTableAttachmentSelection rows](self, "rows");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v5 = v4;
      v3 = objc_msgSend(v4, "count") != 0;
      goto LABEL_13;
    case 4uLL:
      -[ICTableAttachmentSelection columns](self, "columns");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        -[ICTableAttachmentSelection rows](self, "rows");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v6, "count") != 0;
LABEL_11:

      }
      else
      {
LABEL_12:
        v3 = 0;
      }
LABEL_13:

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (void)unselect
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (!-[ICTableAttachmentSelection type](self, "type"))
  {
    -[ICTableAttachmentSelection rows](self, "rows");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {

    }
    else
    {
      -[ICTableAttachmentSelection columns](self, "columns");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (!v5)
        return;
    }
  }
  -[ICTableAttachmentSelection setType:](self, "setType:", 0);
  v6 = MEMORY[0x1E0C9AA60];
  -[ICTableAttachmentSelection setColumns:](self, "setColumns:", MEMORY[0x1E0C9AA60]);
  -[ICTableAttachmentSelection setRows:](self, "setRows:", v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICTableAttachmentSelectionDidChangeNotification"), self);

}

- (void)selectCellAtColumn:(id)a3 row:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTableAttachmentSelection selectCellAtColumn:row:]", 1, 0, CFSTR("We tried to select a cell without a row or column"));
  if (-[ICTableAttachmentSelection type](self, "type") == 1)
  {
    -[ICTableAttachmentSelection rows](self, "rows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToArray:", v10) & 1) != 0)
    {
      -[ICTableAttachmentSelection columns](self, "columns");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToArray:", v12);

      if ((v13 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  -[ICTableAttachmentSelection setType:](self, "setType:", 1);
  v18 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentSelection setColumns:](self, "setColumns:", v14);

  v17 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentSelection setRows:](self, "setRows:", v15);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("ICTableAttachmentSelectionDidChangeNotification"), self);

LABEL_10:
}

- (void)selectColumns:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ICTableAttachmentSelection type](self, "type") != 2)
    goto LABEL_5;
  -[ICTableAttachmentSelection rows](self, "rows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

LABEL_5:
    -[ICTableAttachmentSelection setType:](self, "setType:", 2);
    -[ICTableAttachmentSelection setColumns:](self, "setColumns:", v8);
    -[ICTableAttachmentSelection setRows:](self, "setRows:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICTableAttachmentSelectionDidChangeNotification"), self);

    goto LABEL_6;
  }
  -[ICTableAttachmentSelection columns](self, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToArray:", v8);

  if ((v6 & 1) == 0)
    goto LABEL_5;
LABEL_6:

}

- (void)selectRows:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ICTableAttachmentSelection type](self, "type") != 3)
    goto LABEL_5;
  -[ICTableAttachmentSelection columns](self, "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

LABEL_5:
    -[ICTableAttachmentSelection setType:](self, "setType:", 3);
    -[ICTableAttachmentSelection setColumns:](self, "setColumns:", MEMORY[0x1E0C9AA60]);
    -[ICTableAttachmentSelection setRows:](self, "setRows:", v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICTableAttachmentSelectionDidChangeNotification"), self);

    goto LABEL_6;
  }
  -[ICTableAttachmentSelection rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToArray:", v8);

  if ((v6 & 1) == 0)
    goto LABEL_5;
LABEL_6:

}

- (void)selectCellRangeAtColumns:(id)a3 rows:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (-[ICTableAttachmentSelection type](self, "type") == 4)
  {
    -[ICTableAttachmentSelection columns](self, "columns");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToArray:", v11) & 1) != 0)
    {
      -[ICTableAttachmentSelection rows](self, "rows");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToArray:", v6);

      if ((v9 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
  }
  -[ICTableAttachmentSelection setType:](self, "setType:", 4);
  -[ICTableAttachmentSelection setColumns:](self, "setColumns:", v11);
  -[ICTableAttachmentSelection setRows:](self, "setRows:", v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("ICTableAttachmentSelectionDidChangeNotification"), self);

LABEL_7:
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICTableAttachmentSelection type](self, "type");
    if (v6 == objc_msgSend(v5, "type"))
    {
      -[ICTableAttachmentSelection columns](self, "columns");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "columns");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[ICTableAttachmentSelection rows](self, "rows");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "rows");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICTableAttachmentSelection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[ICTableAttachmentSelection init](+[ICTableAttachmentSelection allocWithZone:](ICTableAttachmentSelection, "allocWithZone:"), "init");
  -[ICTableAttachmentSelection setType:](v5, "setType:", -[ICTableAttachmentSelection type](self, "type"));
  -[ICTableAttachmentSelection columns](self, "columns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[ICTableAttachmentSelection setColumns:](v5, "setColumns:", v7);

  -[ICTableAttachmentSelection rows](self, "rows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[ICTableAttachmentSelection setRows:](v5, "setRows:", v9);

  -[ICTableAttachmentSelection setMoving:](v5, "setMoving:", -[ICTableAttachmentSelection moving](self, "moving"));
  -[ICTableAttachmentSelection setDraggingText:](v5, "setDraggingText:", -[ICTableAttachmentSelection draggingText](self, "draggingText"));
  return v5;
}

- (void)setSelectionEqualTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[ICTableAttachmentSelection setType:](self, "setType:", objc_msgSend(v4, "type"));
  objc_msgSend(v4, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentSelection setColumns:](self, "setColumns:", v5);

  objc_msgSend(v4, "rows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentSelection setRows:](self, "setRows:", v6);

  -[ICTableAttachmentSelection setMoving:](self, "setMoving:", objc_msgSend(v4, "moving"));
  v7 = objc_msgSend(v4, "draggingText");

  -[ICTableAttachmentSelection setDraggingText:](self, "setDraggingText:", v7);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("ICTableAttachmentSelectionDidChangeNotification"), self);

}

- (BOOL)removeColumns:(id)a3 rows:(id)a4 previousColumns:(id)a5 previousRows:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  id v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v37 = a6;
  -[ICTableAttachmentSelection columns](self, "columns");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentSelection rows](self, "rows");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectsInArray:", v10);
  objc_msgSend(v16, "removeObjectsInArray:", v11);
  v17 = (void *)objc_msgSend(v15, "copy");
  -[ICTableAttachmentSelection setColumns:](self, "setColumns:", v17);

  v18 = (void *)objc_msgSend(v16, "copy");
  -[ICTableAttachmentSelection setRows:](self, "setRows:", v18);

  -[ICTableAttachmentSelection columns](self, "columns");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
  {
    v35 = v12;
    objc_msgSend(v12, "firstObjectCommonWithArray:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
LABEL_9:

      v12 = v35;
      goto LABEL_10;
    }
    v22 = objc_msgSend(v35, "indexOfObject:", v21);
    if (v22)
    {
      objc_msgSend(v35, "objectAtIndexedSubscript:", v22 - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = (void *)objc_msgSend(v35, "mutableCopy");
      objc_msgSend(v23, "removeObjectsInArray:", v10);
      if (!objc_msgSend(v23, "count"))
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v23, "subarrayWithRange:", 0, 1);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v24;
    -[ICTableAttachmentSelection setColumns:](self, "setColumns:", v24);

    goto LABEL_8;
  }
LABEL_10:
  -[ICTableAttachmentSelection rows](self, "rows");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (!v27)
  {
    v36 = v12;
    objc_msgSend(v37, "firstObjectCommonWithArray:", v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
LABEL_18:

      v12 = v36;
      goto LABEL_19;
    }
    v29 = objc_msgSend(v37, "indexOfObject:", v28);
    if (v29)
    {
      objc_msgSend(v37, "objectAtIndexedSubscript:", v29 - 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = (void *)objc_msgSend(v37, "mutableCopy");
      objc_msgSend(v30, "removeObjectsInArray:", v11);
      if (!objc_msgSend(v30, "count"))
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v30, "subarrayWithRange:", 0, 1);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    v32 = (void *)v31;
    -[ICTableAttachmentSelection setRows:](self, "setRows:", v31);

    goto LABEL_17;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "postNotificationName:object:", CFSTR("ICTableAttachmentSelectionDidChangeNotification"), self);

  LOBYTE(v33) = -[ICTableAttachmentSelection valid](self, "valid");
  return (char)v33;
}

- (BOOL)removeColumns:(id)a3 rows:(id)a4
{
  return -[ICTableAttachmentSelection removeColumns:rows:previousColumns:previousRows:](self, "removeColumns:rows:previousColumns:previousRows:", a3, a4, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)moving
{
  return self->_moving;
}

- (void)setMoving:(BOOL)a3
{
  self->_moving = a3;
}

- (BOOL)draggingText
{
  return self->_draggingText;
}

- (void)setDraggingText:(BOOL)a3
{
  self->_draggingText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
