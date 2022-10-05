import 'package:weebflix/services/http_service.dart';
import 'package:weebflix/model/anime_model/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 223, 255),
      appBar: AppBar(
        title: const Text('Weebflix'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 124, 108, 153),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Anime Now',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: FutureBuilder<List<AnimeModel>>(
                future: httpService.getPopular(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Tidak ada data'));
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var animeData = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18)),
                            height: 200,
                            width: 200,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.network(
                                      animeData.animeImg.toString(),
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          animeData.animeTitle.toString(),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Released: ${animeData.releasedDate}',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const Text('Recent Release',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Expanded(
              child: FutureBuilder<List<AnimeModel>>(
                future: httpService.getRecent(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Tidak ada data'));
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var animeData = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    animeData.animeImg.toString(),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  animeData.animeTitle.toString(),
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const Text('Anime Movies',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Expanded(
              child: FutureBuilder<List<AnimeModel>>(
                future: httpService.getMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Tidak ada data'));
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var animeData = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    animeData.animeImg.toString(),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  animeData.animeTitle.toString(),
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
