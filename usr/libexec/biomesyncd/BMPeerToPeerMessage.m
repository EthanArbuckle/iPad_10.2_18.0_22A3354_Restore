@implementation BMPeerToPeerMessage

- (id)initFromDictionary:(id)a3
{
  id v4;
  BMPeerToPeerMessage *v5;
  void *v6;
  BMSyncDevicePeer *v7;
  void *v8;
  BMSyncDevicePeer *v9;
  BMSyncDevicePeer *peer;
  void *v11;
  double v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BMPeerToPeerMessage;
  v5 = -[BMPeerToPeerMessage init](&v15, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protocolVersion")));
    v5->_protocolVersion = (unint64_t)objc_msgSend(v6, "unsignedIntegerValue");

    v7 = [BMSyncDevicePeer alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peer")));
    v9 = -[BMSyncDevicePeer initFromDictionary:](v7, "initFromDictionary:", v8);
    peer = v5->_peer;
    v5->_peer = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("walltime")));
    objc_msgSend(v11, "doubleValue");
    v5->_walltime = v12;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncReason")));
    v5->_syncReason = (unint64_t)objc_msgSend(v13, "unsignedIntegerValue");

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  v9[0] = CFSTR("protocolVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_protocolVersion));
  v10[0] = v3;
  v9[1] = CFSTR("peer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeer dictionaryRepresentation](self->_peer, "dictionaryRepresentation"));
  v10[1] = v4;
  v9[2] = CFSTR("walltime");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_walltime));
  v10[2] = v5;
  v9[3] = CFSTR("syncReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_syncReason));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));

  return v7;
}

- (BMSyncDevicePeer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_storeStrong((id *)&self->_peer, a3);
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
}

- (double)walltime
{
  return self->_walltime;
}

- (void)setWalltime:(double)a3
{
  self->_walltime = a3;
}

- (unint64_t)syncReason
{
  return self->_syncReason;
}

- (void)setSyncReason:(unint64_t)a3
{
  self->_syncReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peer, 0);
}

@end
