@implementation SRSensorDescriptionEnumerator

- (void)dealloc
{
  objc_super v3;

  if (self)
    objc_setProperty_atomic(self, a2, 0, 24);

  v3.receiver = self;
  v3.super_class = (Class)SRSensorDescriptionEnumerator;
  -[SRSensorDescriptionEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  unint64_t currentSensorDirectoryIndex;
  void *sensorsCache;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  void *Property;
  uint64_t v9;
  void *v10;
  void *v11;
  SEL v12;
  void *v13;
  const char *v14;
  char v15;
  id result;
  unint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  SEL v23;
  id v24[2];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  currentSensorDirectoryIndex = self->_currentSensorDirectoryIndex;
  sensorsCache = self->_sensorsCache;
  if (sensorsCache)
    sensorsCache = objc_getProperty(sensorsCache, a2, 16, 1);
  if (currentSensorDirectoryIndex >= objc_msgSend(sensorsCache, "count"))
  {
    v7 = SRLogSensorsCache;
    if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v24[0]) = 0;
      _os_log_fault_impl(&dword_245CD7000, v7, OS_LOG_TYPE_FAULT, "Unexpectedly trying to iterate beyond the maximum number of directories", (uint8_t *)v24, 2u);
    }
    return 0;
  }
  if (self->_descriptionFileEnumerator)
  {
    v6 = *MEMORY[0x24BDBCC60];
  }
  else
  {
    Property = self->_sensorsCache;
    if (Property)
      Property = objc_getProperty(Property, v5, 16, 1);
    v9 = objc_msgSend(Property, "objectAtIndexedSubscript:", self->_currentSensorDirectoryIndex);
    v10 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = *MEMORY[0x24BDBCC60];
    v25[0] = *MEMORY[0x24BDBCC60];
    v11 = (void *)objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1), 4, 0);
    objc_setProperty_atomic(self, v12, v11, 24);
  }
  while (1)
  {
    v13 = (void *)-[NSDirectoryEnumerator nextObject](self->_descriptionFileEnumerator, "nextObject");
    v24[0] = 0;
    objc_msgSend(v13, "getResourceValue:forKey:error:", v24, v6, 0);
    v15 = objc_msgSend(v24[0], "BOOLValue");
    result = 0;
    if ((v15 & 1) == 0)
      break;
LABEL_20:
    if (result)
      return result;
  }
  if (v13)
    goto LABEL_19;
  v17 = self->_currentSensorDirectoryIndex + 1;
  self->_currentSensorDirectoryIndex = v17;
  v18 = self->_sensorsCache;
  if (v18)
    v18 = objc_getProperty(v18, v14, 16, 1);
  if (v17 < objc_msgSend(v18, "count"))
  {
    v20 = self->_sensorsCache;
    if (v20)
      v20 = objc_getProperty(v20, v19, 16, 1);
    v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", self->_currentSensorDirectoryIndex);
    v22 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v21, 0, 4, 0);
    objc_setProperty_atomic(self, v23, v22, 24);
    v13 = (void *)-[NSDirectoryEnumerator nextObject](self->_descriptionFileEnumerator, "nextObject");
    if (v13)
    {
LABEL_19:
      result = -[SRSensorsCache descriptionForSensor:]((uint64_t)self->_sensorsCache, (void *)objc_msgSend((id)objc_msgSend(v13, "URLByDeletingPathExtension"), "lastPathComponent"));
      goto LABEL_20;
    }
  }
  objc_setProperty_atomic(self, v19, 0, 24);
  return 0;
}

@end
