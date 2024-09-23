@implementation AppleTypeCRetimerFifoDumper

- (AppleTypeCRetimerFifoDumper)initWithBloodhoundDumper:(id)a3
{
  id v5;
  AppleTypeCRetimerFifoDumper *v6;
  AppleTypeCRetimerFifoDumper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppleTypeCRetimerFifoDumper;
  v6 = -[AppleTypeCRetimerFifoDumper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dumper, a3);

  return v7;
}

- (void)dumpAccessForRegisterAddress:(unsigned __int8)a3 ioReturn:(unsigned int)a4 data:(id)a5
{
  __int16 v5;
  unsigned __int8 v6;
  unsigned int v7;

  v5 = 7;
  v6 = a3;
  v7 = a4;
  -[ATCRTBloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:](self->_dumper, "dumpPacket:type:metadata:metadataLength:", a5, 10, &v5, 7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dumper, 0);
}

@end
