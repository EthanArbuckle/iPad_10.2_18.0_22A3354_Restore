@implementation _PLPhotoLibraryFileReservation

- (_PLPhotoLibraryFileReservation)initWithFileDescriptor:(int)a3
{
  uint64_t v3;
  _PLPhotoLibraryFileReservation *v4;
  _PLPhotoLibraryFileReservation *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)_PLPhotoLibraryFileReservation;
  v4 = -[_PLPhotoLibraryFileReservation init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[_PLPhotoLibraryFileReservation setFileDescriptor:](v4, "setFileDescriptor:", v3);
  return v5;
}

- (void)dealloc
{
  int v3;
  int v4;
  objc_super v5;

  v3 = -[_PLPhotoLibraryFileReservation fileDescriptor](self, "fileDescriptor");
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v3;
    flock(v3, 8);
    close(v4);
    -[_PLPhotoLibraryFileReservation setFileDescriptor:](self, "setFileDescriptor:", 0xFFFFFFFFLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)_PLPhotoLibraryFileReservation;
  -[_PLPhotoLibraryFileReservation dealloc](&v5, sel_dealloc);
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)setFileDescriptor:(int)a3
{
  self->_fileDescriptor = a3;
}

@end
