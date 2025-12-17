import 'package:x_clone/post.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset("assets/images/image.png", width: 100),
          leading: const Center(
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage("https://picsum.photos/300/300"),
            ),
          ),
          bottom: const TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey,
            dividerHeight: 0.5,
            dividerColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'For You'),
              Tab(text: 'Following'),
              Tab(text: 'Subscribed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: Post.samplePosts.length,
              itemBuilder: (context, index) {
                return PostEntry(post: Post.samplePosts[index]);
              },
            ),
            const Text('Following Tab'),
            const Text('Subscribed Tab'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          iconSize: 36.0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline_outlined),
              label: '',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // setState() {}
          },
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class PostEntry extends StatelessWidget {
  final Post post;

  const PostEntry({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      padding: const EdgeInsets.all(12),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(post.profilePictureUrl),
              backgroundColor: Colors.grey[200],
            ),
            //Image.network(post.profilePictureUrl, width: 20.0, height: 20.0, ,),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(post.name),
                      const SizedBox(width: 1),

                      if (post.verified == true)
                        const Icon(
                          Icons.verified,
                          size: 16,
                          color: Colors.blue,
                        ),
                      const SizedBox(width: 5),
                      Text(post.handle),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.circle,
                        size: 5.0, // Make it tiny
                        color: Colors.grey,
                      ),
                      Text(post.time),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(post.content),
                  const SizedBox(height: 3),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [Text(post.content)],
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.comment),
                          const SizedBox(width: 2),
                          Text(post.comments),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.repeat),
                          const SizedBox(width: 2),
                          Text(post.reposts),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.favorite_border),
                          const SizedBox(width: 2),
                          Text(post.likes),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Icon(Icons.bar_chart),
                          const SizedBox(width: 2),
                          Text(post.views),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.more_horiz), Spacer(), Icon(Icons.upload)],
            ),
          ],
        ),
      ),
    );
  }
}
