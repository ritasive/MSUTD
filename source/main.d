import std.stdio;

import std.functional;

import msutd.core;

string title = "Mayhem Smash-Up Tower Defense";

int main(string[] args)
{
	Window win = new Window(VideoMode(1280, 720), title);
	Font f = Font("/usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-L.ttf", 32, Font.Mode.Blended);
	Text t = new Text(f);
	t.setPosition(0, 0);
	
	bool down = false;
	short x = 0;
	short y = 0;
	
	Events.set_mouse_motion_callback((e) {
		x = e.x;
		y = e.y;
	});
	Events.set_quit_callback(() => win.close());
	
	while (win.isOpen()) {
		win.clear();
		
		win.setClearColor(1, sin(x / 1000.0).abs(), sin(y / 1000.0).abs());
		
		t.format("X: %d | Y: %d", x, y);
		
		win.draw(t);
		
		win.display();
		Events.poll();
	}
	
	return 0;
}