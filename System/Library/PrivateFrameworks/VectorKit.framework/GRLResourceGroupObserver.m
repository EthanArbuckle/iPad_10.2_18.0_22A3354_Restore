@implementation GRLResourceGroupObserver

- (GRLResourceGroupObserver)initWithResourceProvider:(void *)a3
{
  GRLResourceGroupObserver *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GRLResourceGroupObserver;
  result = -[GRLResourceGroupObserver init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 850045863;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 9) = 0;
  return self;
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  std::mutex *v4;
  grl::ResourceProvider *v5;

  v4 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v5 = (grl::ResourceProvider *)*((_QWORD *)self + 1);
  if (v5)
    grl::ResourceProvider::notifyObserversOfTileGroupChange(v5);
  std::mutex::unlock(v4);
}

- (void)clearProvider
{
  std::mutex *v3;

  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  *((_QWORD *)self + 1) = 0;
  std::mutex::unlock(v3);
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 16));
}

@end
