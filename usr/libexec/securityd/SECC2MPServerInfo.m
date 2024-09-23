@implementation SECC2MPServerInfo

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasPartition
{
  return self->_partition != 0;
}

- (BOOL)hasServiceBuild
{
  return self->_serviceBuild != 0;
}

- (BOOL)hasServiceInstance
{
  return self->_serviceInstance != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SECC2MPServerInfo;
  v3 = -[SECC2MPServerInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPServerInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *serviceName;
  NSString *partition;
  NSString *serviceBuild;
  NSString *serviceInstance;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v3, "setObject:forKey:", serviceName, CFSTR("service_name"));
  partition = self->_partition;
  if (partition)
    objc_msgSend(v4, "setObject:forKey:", partition, CFSTR("partition"));
  serviceBuild = self->_serviceBuild;
  if (serviceBuild)
    objc_msgSend(v4, "setObject:forKey:", serviceBuild, CFSTR("service_build"));
  serviceInstance = self->_serviceInstance;
  if (serviceInstance)
    objc_msgSend(v4, "setObject:forKey:", serviceInstance, CFSTR("service_instance"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001C1A80((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *serviceName;
  NSString *partition;
  NSString *serviceBuild;
  NSString *serviceInstance;
  id v9;

  v4 = a3;
  serviceName = self->_serviceName;
  v9 = v4;
  if (serviceName)
  {
    PBDataWriterWriteStringField(v4, serviceName, 102);
    v4 = v9;
  }
  partition = self->_partition;
  if (partition)
  {
    PBDataWriterWriteStringField(v9, partition, 103);
    v4 = v9;
  }
  serviceBuild = self->_serviceBuild;
  if (serviceBuild)
  {
    PBDataWriterWriteStringField(v9, serviceBuild, 104);
    v4 = v9;
  }
  serviceInstance = self->_serviceInstance;
  if (serviceInstance)
  {
    PBDataWriterWriteStringField(v9, serviceInstance, 105);
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_serviceName)
  {
    objc_msgSend(v4, "setServiceName:");
    v4 = v5;
  }
  if (self->_partition)
  {
    objc_msgSend(v5, "setPartition:");
    v4 = v5;
  }
  if (self->_serviceBuild)
  {
    objc_msgSend(v5, "setServiceBuild:");
    v4 = v5;
  }
  if (self->_serviceInstance)
  {
    objc_msgSend(v5, "setServiceInstance:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_partition, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_serviceBuild, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_serviceInstance, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *serviceName;
  NSString *partition;
  NSString *serviceBuild;
  NSString *serviceInstance;
  unsigned __int8 v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[4]))
     || -[NSString isEqual:](serviceName, "isEqual:"))
    && ((partition = self->_partition, !((unint64_t)partition | v4[1]))
     || -[NSString isEqual:](partition, "isEqual:"))
    && ((serviceBuild = self->_serviceBuild, !((unint64_t)serviceBuild | v4[2]))
     || -[NSString isEqual:](serviceBuild, "isEqual:")))
  {
    serviceInstance = self->_serviceInstance;
    if ((unint64_t)serviceInstance | v4[3])
      v9 = -[NSString isEqual:](serviceInstance, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_serviceName, "hash");
  v4 = -[NSString hash](self->_partition, "hash") ^ v3;
  v5 = -[NSString hash](self->_serviceBuild, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_serviceInstance, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[SECC2MPServerInfo setServiceName:](self, "setServiceName:");
  if (v4[1])
    -[SECC2MPServerInfo setPartition:](self, "setPartition:");
  if (v4[2])
    -[SECC2MPServerInfo setServiceBuild:](self, "setServiceBuild:");
  if (v4[3])
    -[SECC2MPServerInfo setServiceInstance:](self, "setServiceInstance:");

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPartition:(id)a3
{
  objc_storeStrong((id *)&self->_partition, a3);
}

- (NSString)serviceBuild
{
  return self->_serviceBuild;
}

- (void)setServiceBuild:(id)a3
{
  objc_storeStrong((id *)&self->_serviceBuild, a3);
}

- (NSString)serviceInstance
{
  return self->_serviceInstance;
}

- (void)setServiceInstance:(id)a3
{
  objc_storeStrong((id *)&self->_serviceInstance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serviceInstance, 0);
  objc_storeStrong((id *)&self->_serviceBuild, 0);
  objc_storeStrong((id *)&self->_partition, 0);
}

@end
