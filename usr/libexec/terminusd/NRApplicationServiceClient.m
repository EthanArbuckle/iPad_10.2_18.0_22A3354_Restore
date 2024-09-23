@implementation NRApplicationServiceClient

- (NSString)description
{
  id v3;
  const char *v4;
  id v5;
  NSMutableArray *asNamesForIncomingResolveRequests;

  v3 = objc_alloc((Class)NSMutableString);
  if (self)
  {
    if (self->_started)
    {
      v4 = "started";
    }
    else if (self->_cancelled)
    {
      v4 = "cancelled";
    }
    else
    {
      v4 = "";
    }
    v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("NRASClient[%llu %s "), self->_identifier, v4);
    objc_msgSend(v5, "appendFormat:", CFSTR("browsing: %@ "), self->_asNamesForBrowsing);
    objc_msgSend(v5, "appendFormat:", CFSTR("resolving: %@ "), self->_asNamesForResolving);
    asNamesForIncomingResolveRequests = self->_asNamesForIncomingResolveRequests;
  }
  else
  {
    v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("NRASClient[%llu %s "), 0, ");
    objc_msgSend(v5, "appendFormat:", CFSTR("browsing: %@ "), 0);
    objc_msgSend(v5, "appendFormat:", CFSTR("resolving: %@ "), 0);
    asNamesForIncomingResolveRequests = 0;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("incoming-requests: %@ "), asNamesForIncomingResolveRequests);
  objc_msgSend(v5, "appendString:", CFSTR("]"));
  return (NSString *)v5;
}

- (void)dealloc
{
  NRApplicationServiceClient *v2;
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  NSUUID *nrUUID;
  NSUUID *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v2 = self;
  if (self)
    self = (NRApplicationServiceClient *)self->_nrUUID;
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1);

  if (IsLevelEnabled)
  {
    if (v2)
      nrUUID = v2->_nrUUID;
    else
      nrUUID = 0;
    v7 = nrUUID;
    v9 = (void *)_NRCopyLogObjectForNRUUID(v7, v8);
    _NRLogWithArgs(v9, 1, "%s%.30s:%-4d %@ dealloc", ", "-[NRApplicationServiceClient dealloc]", 807, v2);

  }
  sub_1000F6A3C((uint64_t)v2, v5);
  v10.receiver = v2;
  v10.super_class = (Class)NRApplicationServiceClient;
  -[NRApplicationServiceClient dealloc](&v10, "dealloc");
}

- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  NRApplicationServiceClient *v6;
  NRApplicationServiceClient *v7;
  uint64_t v8;
  NSUUID *nrUUID;
  void *v10;
  int IsLevelEnabled;
  uint64_t v12;
  NSUUID *v13;
  id WeakRetained;
  unsigned __int8 v15;
  id v16;

  v16 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  v7 = v6;
  if (v6 != self)
    goto LABEL_13;
  if (v6)
  {
    if (v6->_cancelled)
      goto LABEL_13;
    if (-[NSMutableArray containsObject:](v6->_asNamesForBrowsing, "containsObject:", v16))
    {
      nrUUID = v7->_nrUUID;
      goto LABEL_6;
    }
    -[NSMutableArray addObject:](v7->_asNamesForBrowsing, "addObject:", v16);
    WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
LABEL_11:
    objc_msgSend(WeakRetained, "didStartBrowseRequestForASName:asClient:", v16, v7);
LABEL_12:

    goto LABEL_13;
  }
  v15 = objc_msgSend(0, "containsObject:", v16);
  nrUUID = 0;
  if ((v15 & 1) == 0)
  {
    objc_msgSend(0, "addObject:", v16);
    WeakRetained = 0;
    goto LABEL_11;
  }
LABEL_6:
  v10 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v8);
  IsLevelEnabled = _NRLogIsLevelEnabled(v10, 0);

  if (IsLevelEnabled)
  {
    if (v7)
      v13 = v7->_nrUUID;
    else
      v13 = 0;
    WeakRetained = (id)_NRCopyLogObjectForNRUUID(v13, v12);
    _NRLogWithArgs(WeakRetained, 0, "%s%.30s:%-4d already browsing for %@", ", "-[NRApplicationServiceClient didStartBrowseRequestForASName:asClient:]", 916, v16);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  NRApplicationServiceClient *v6;
  id *p_isa;
  id WeakRetained;
  id v9;

  v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (!v6)
    {
      if ((objc_msgSend(0, "containsObject:", v9) & 1) == 0)
        goto LABEL_7;
      objc_msgSend(0, "removeObject:", v9);
      WeakRetained = 0;
      goto LABEL_6;
    }
    if (!v6->_cancelled
      && -[NSMutableArray containsObject:](v6->_asNamesForBrowsing, "containsObject:", v9))
    {
      objc_msgSend(p_isa[2], "removeObject:", v9);
      WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_6:
      objc_msgSend(WeakRetained, "didStopBrowseRequestForASName:asClient:", v9, p_isa);

    }
  }
LABEL_7:

}

- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4
{
  NRApplicationServiceClient *v6;
  id *p_isa;
  id WeakRetained;
  id v9;

  v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (!v6)
    {
      WeakRetained = 0;
      if ((objc_msgSend(0, "containsObject:", v9) & 1) == 0)
      {
        objc_msgSend(0, "addObject:", v9);
        WeakRetained = 0;
      }
      goto LABEL_7;
    }
    if (!v6->_cancelled)
    {
      if ((-[NSMutableArray containsObject:](v6->_asNamesForResolving, "containsObject:", v9) & 1) == 0)
        objc_msgSend(p_isa[3], "addObject:", v9);
      WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_7:
      objc_msgSend(WeakRetained, "didStartResolveRequestForASName:asClient:", v9, p_isa);

    }
  }

}

- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4
{
  NRApplicationServiceClient *v6;
  id *p_isa;
  id WeakRetained;
  id v9;

  v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (!v6)
    {
      if ((objc_msgSend(0, "containsObject:", v9) & 1) == 0)
        goto LABEL_7;
      objc_msgSend(0, "removeObject:", v9);
      WeakRetained = 0;
      goto LABEL_6;
    }
    if (!v6->_cancelled
      && -[NSMutableArray containsObject:](v6->_asNamesForResolving, "containsObject:", v9))
    {
      objc_msgSend(p_isa[3], "removeObject:", v9);
      WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_6:
      objc_msgSend(WeakRetained, "didStopResolveRequestForASName:asClient:", v9, p_isa);

    }
  }
LABEL_7:

}

- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4
{
  NRApplicationServiceClient *v6;
  id *p_isa;
  id WeakRetained;
  id v9;

  v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (!v6)
    {
      WeakRetained = 0;
      if ((objc_msgSend(0, "containsObject:", v9) & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
    if (!v6->_cancelled
      && -[NSMutableArray containsObject:](v6->_asNamesForIncomingResolveRequests, "containsObject:", v9))
    {
      WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_6:
      objc_msgSend(WeakRetained, "didCompleteIncomingResolveRequestForASName:asClient:", v9, p_isa);

    }
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asNamesForIncomingResolveRequests, 0);
  objc_storeStrong((id *)&self->_asNamesForResolving, 0);
  objc_storeStrong((id *)&self->_asNamesForBrowsing, 0);
}

@end
