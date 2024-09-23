@implementation KCSharingOutgoingChangeset

- (KCSharingOutgoingChangeset)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4 cursor:(id)a5
{
  id v8;
  id v9;
  id v10;
  KCSharingOutgoingChangeset *v11;
  NSArray *v12;
  NSArray *recordsToSave;
  NSArray *v14;
  NSArray *recordIDsToDelete;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)KCSharingOutgoingChangeset;
  v11 = -[KCSharingOutgoingChangeset init](&v17, "init");
  if (v11)
  {
    v12 = (NSArray *)objc_msgSend(v8, "copy");
    recordsToSave = v11->_recordsToSave;
    v11->_recordsToSave = v12;

    v14 = (NSArray *)objc_msgSend(v9, "copy");
    recordIDsToDelete = v11->_recordIDsToDelete;
    v11->_recordIDsToDelete = v14;

    objc_storeStrong((id *)&v11->_cursor, a5);
  }

  return v11;
}

- (BOOL)isEmpty
{
  return !-[NSArray count](self->_recordsToSave, "count") && -[NSArray count](self->_recordIDsToDelete, "count") == 0;
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (KCSharingOutgoingChangesetCursor)cursor
{
  return self->_cursor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end
