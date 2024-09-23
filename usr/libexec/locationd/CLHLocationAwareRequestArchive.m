@implementation CLHLocationAwareRequestArchive

- (int64_t)classifyLoiTypeForLocation:(id)a3
{
  return -[CLHLocationClassifier loiTypeForLocation:](self->_classifier, "loiTypeForLocation:", a3);
}

- (CLHLocationAwareRequestArchive)initWithClassifier:(id)a3 rootDirectory:(id)a4 basename:(id)a5 requestCode:(int)a6 itemCountThresholdForAutoCleanUp:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  CLHLocationAwareRequestArchive *v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v17.receiver = self;
  v17.super_class = (Class)CLHLocationAwareRequestArchive;
  v12 = -[CLHLocationAwareRequestArchive init](&v17, "init");
  if (v12)
  {
    v12->_classifier = (CLHLocationClassifier *)a3;
    v13 = objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a5, "stringByAppendingString:", CFSTR("-home")));
    v14 = objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a5, "stringByAppendingString:", CFSTR("-work")));
    v15 = objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a5, "stringByAppendingString:", CFSTR("-main")));
    v12->_homeArchive = -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:", objc_msgSend(v13, "path"), v8, v7);
    v12->_workArchive = -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:", objc_msgSend(v14, "path"), v8, v7);
    v12->_mainArchive = -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:", objc_msgSend(v15, "path"), v8, v7);
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHLocationAwareRequestArchive;
  -[CLHLocationAwareRequestArchive dealloc](&v3, "dealloc");
}

- (unint64_t)count
{
  unint64_t v3;
  char *v4;

  v3 = -[CLHRequestArchive totalCountIncludingAllSubArchives](self->_homeArchive, "totalCountIncludingAllSubArchives");
  v4 = (char *)-[CLHRequestArchive totalCountIncludingAllSubArchives](self->_workArchive, "totalCountIncludingAllSubArchives")+ v3;
  return -[CLHRequestArchive totalCountIncludingAllSubArchives](self->_mainArchive, "totalCountIncludingAllSubArchives")
       + (_QWORD)v4;
}

- (void)writeSecondaryObject:(id)a3 collectedAt:(id)a4 toField:(unsigned int)a5
{
  uint64_t v5;
  int64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)&a5;
  v8 = -[CLHLocationAwareRequestArchive classifyLoiTypeForLocation:](self, "classifyLoiTypeForLocation:", a4);
  v9 = 32;
  if (v8 == 1)
    v9 = 24;
  if (!v8)
    v9 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v9), "writeSecondaryObject:toField:", a3, v5);
}

- (void)pruneSecondaryDataOlderThan:(double)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  __int128 v16;
  CLHRequestArchive *mainArchive;

  v16 = *(_OWORD *)&self->_homeArchive;
  mainArchive = self->_mainArchive;
  v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isActiveSubArchive"))
        {
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          v10[2] = sub_1012127B0;
          v10[3] = &unk_1021A9340;
          *(double *)&v10[4] = a3;
          objc_msgSend(v9, "iterateSubArchivesWithHandler:", v10);
        }
        else
        {
          objc_msgSend(v9, "pruneSecondaryDataOlderThan:", a3);
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
}

- (id)jsonObject
{
  _QWORD v4[3];
  _QWORD v5[3];

  v4[0] = CFSTR("homeArchive");
  v5[0] = -[CLHRequestArchive jsonObject](self->_homeArchive, "jsonObject");
  v4[1] = CFSTR("workArchive");
  v5[1] = -[CLHRequestArchive jsonObject](self->_workArchive, "jsonObject");
  v4[2] = CFSTR("mainArchive");
  v5[2] = -[CLHRequestArchive jsonObject](self->_mainArchive, "jsonObject");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (void)eraseAllData
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  __int128 v13;
  CLHRequestArchive *mainArchive;

  v13 = *(_OWORD *)&self->_homeArchive;
  mainArchive = self->_mainArchive;
  v2 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isActiveSubArchive"))
        {
          objc_msgSend(v7, "iterateSubArchivesWithHandler:", &stru_1021A9380);
          objc_msgSend(v7, "generateNewSubArchive");
        }
        else
        {
          objc_msgSend(v7, "eraseAllData");
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
}

- (CLHRequestArchive)homeArchive
{
  return self->_homeArchive;
}

- (CLHRequestArchive)workArchive
{
  return self->_workArchive;
}

- (CLHRequestArchive)mainArchive
{
  return self->_mainArchive;
}

@end
