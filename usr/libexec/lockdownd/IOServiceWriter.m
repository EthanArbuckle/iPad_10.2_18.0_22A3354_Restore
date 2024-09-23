@implementation IOServiceWriter

- (IOServiceWriter)initWithService:(unsigned int)a3
{
  IOServiceWriter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOServiceWriter;
  v4 = -[IOServiceWriter init](&v6, "init");
  if (v4)
  {
    IOObjectRetain(a3);
    v4->_service = a3;
  }
  return v4;
}

- (BOOL)isAvailable
{
  return -[IOServiceWriter openService](self, "openService") == 0;
}

- (int)writeBytes:(char *)a3 ofLength:(unint64_t)a4 withError:(id *)a5
{
  return -[IOServiceWriter writeData:withError:](self, "writeData:withError:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, a4), a5);
}

- (int)writeData:(id)a3 withError:(id *)a4
{
  kern_return_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSError *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v6 = IORegistryEntrySetCFProperty(-[IOServiceWriter service](self, "service"), CFSTR("FLASH"), a3);
  if (v6)
  {
    v7 = objc_msgSend(a3, "length");
    v13 = MSUBootFirmwareError(v6, 0, (uint64_t)CFSTR("writeData: Failed writing %d bytes with error %d"), v8, v9, v10, v11, v12, (uint64_t)v7);
    if (a4)
      *a4 = MSUBootFirmwareError(3, (uint64_t)v13, (uint64_t)CFSTR("FLASH operation failed while writing to single SPI."), v14, v15, v16, v17, v18, v20);
  }
  return v6;
}

- (int)openService
{
  io_service_t v3;

  v3 = -[IOServiceWriter service](self, "service");
  return IOServiceOpen(v3, mach_task_self_, 0, &self->_serviceConnect);
}

- (id)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4
{
  return 0;
}

- (int)readDataAtOffset:(unsigned int)a3 ofLength:(unsigned int)a4 intoBuffer:(void *)a5
{
  return -536870201;
}

- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4 withError:(id *)a5
{
  return -536870201;
}

- (BOOL)finished
{
  io_connect_t serviceConnect;
  io_object_t service;

  serviceConnect = self->_serviceConnect;
  if (serviceConnect)
  {
    IOServiceClose(serviceConnect);
    self->_serviceConnect = 0;
  }
  service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_service = 0;
  }
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[IOServiceWriter finished](self, "finished");
  v3.receiver = self;
  v3.super_class = (Class)IOServiceWriter;
  -[IOServiceWriter dealloc](&v3, "dealloc");
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)serviceConnect
{
  return self->_serviceConnect;
}

- (void)setServiceConnect:(unsigned int)a3
{
  self->_serviceConnect = a3;
}

- (BOOL)isErase
{
  return self->_isErase;
}

- (void)setIsErase:(BOOL)a3
{
  self->_isErase = a3;
}

- (BOOL)shouldCommit
{
  return self->_shouldCommit;
}

- (void)setShouldCommit:(BOOL)a3
{
  self->_shouldCommit = a3;
}

@end
