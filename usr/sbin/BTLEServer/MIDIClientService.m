@implementation MIDIClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDMIDIServiceString);
}

- (MIDIClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  MIDIClientService *v5;
  MIDIClientService *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MIDIClientService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v8, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setIsPrimary:](v5, "setIsPrimary:", 1);
    -[ClientService setPriority:](v6, "setPriority:", 9);
    -[ClientService setStartTimeout:](v6, "setStartTimeout:", 0.0);
  }
  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIDIClientService;
  -[ClientService start](&v5, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PeerIsUsingBuiltinServiceNotification"), v4);

  -[ClientService notifyDidStart](self, "notifyDidStart");
}

@end
