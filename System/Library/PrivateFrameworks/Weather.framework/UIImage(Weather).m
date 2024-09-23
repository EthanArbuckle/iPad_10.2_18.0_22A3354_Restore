@implementation UIImage(Weather)

- (id)wa_imageWithSize:()Weather
{
  void *v6;
  void *v7;
  _QWORD v9[7];

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", a2, a3);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__UIImage_Weather__wa_imageWithSize___block_invoke;
  v9[3] = &unk_24DD9E6D0;
  v9[4] = a1;
  *(double *)&v9[5] = a2;
  *(double *)&v9[6] = a3;
  objc_msgSend(v6, "imageWithActions:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
