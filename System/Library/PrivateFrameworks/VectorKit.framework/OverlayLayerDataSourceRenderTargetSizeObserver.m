@implementation OverlayLayerDataSourceRenderTargetSizeObserver

- (void)sizeDidChange:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  read_write_lock *p_mtx;
  geo::read_write_lock *v7;
  const char *v8;
  geo::read_write_lock *v9;
  const char *v10;

  height = a3.height;
  width = a3.width;
  p_mtx = &self->_mtx;
  v7 = (geo::read_write_lock *)pthread_rwlock_wrlock(&self->_mtx._lock);
  if ((_DWORD)v7)
    geo::read_write_lock::logFailure(v7, (uint64_t)"write lock", v8);
  self->_size.width = width;
  self->_size.height = height;
  v9 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_mtx->_lock);
  if ((_DWORD)v9)
    geo::read_write_lock::logFailure(v9, (uint64_t)"unlock", v10);
}

- (id).cxx_construct
{
  read_write_lock *p_mtx;
  geo::read_write_lock *v4;
  const char *v5;

  *(_OWORD *)&self->_mtx._lock.__sig = 0u;
  p_mtx = &self->_mtx;
  *(_QWORD *)&p_mtx->_lock.__opaque[184] = 0;
  *(_OWORD *)&p_mtx->_lock.__opaque[152] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[168] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[120] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[136] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[88] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[104] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[56] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[72] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[24] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[40] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[8] = 0u;
  v4 = (geo::read_write_lock *)pthread_rwlock_init(&p_mtx->_lock, 0);
  if ((_DWORD)v4)
    geo::read_write_lock::logFailure(v4, (uint64_t)"initialization", v5);
  return self;
}

- (CGSize)size
{
  read_write_lock *p_mtx;
  geo::read_write_lock *v4;
  const char *v5;
  CGFloat width;
  CGFloat height;
  geo::read_write_lock *v8;
  const char *v9;
  double v10;
  double v11;
  CGSize result;

  p_mtx = &self->_mtx;
  v4 = (geo::read_write_lock *)pthread_rwlock_rdlock(&self->_mtx._lock);
  if ((_DWORD)v4)
    geo::read_write_lock::logFailure(v4, (uint64_t)"read lock", v5);
  width = self->_size.width;
  height = self->_size.height;
  v8 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_mtx->_lock);
  if ((_DWORD)v8)
    geo::read_write_lock::logFailure(v8, (uint64_t)"unlock", v9);
  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  geo::read_write_lock *v2;
  const char *v3;

  v2 = (geo::read_write_lock *)pthread_rwlock_destroy(&self->_mtx._lock);
  if ((_DWORD)v2)
    geo::read_write_lock::logFailure(v2, (uint64_t)"destruction", v3);
}

@end
