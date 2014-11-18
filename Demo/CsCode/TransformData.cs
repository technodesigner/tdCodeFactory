namespace CodeFactory
{
    public class TransformData
    {
        public string Name { get; set; }
        public double TranslateX { get; set; }
        public double TranslateY { get; set; }
        public double ScaleX { get; set; }
        public double ScaleY { get; set; }
        public TransformData()
        {
            ScaleX = 1;
            ScaleY = 1;
        }
	}
}
